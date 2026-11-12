library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


entity top_cron_basq is
    generic(CLKS_POR_CENTESIMO : integer := 250_000;
				DIV_RATE : integer := 4_000_000);
    port (
        clock, carga, modo_novoquarto, para_continua, reset : in std_logic;
        c_minutos : in std_logic_vector(3 downto 0);
        c_quarto, c_segundos : in std_logic_vector(1 downto 0);
        anodo, minutos, quarto : out std_logic_vector(3 downto 0);
        DSPL_sete_seg : out std_logic_vector(7 downto 0)
    );
end top_cron_basq;

architecture Behavioral of top_cron_basq is
    type MODOS is (NBA, FIBA);

    signal carga_min : integer;
    signal mode : MODOS;
    signal carga_int, para_continua_int, modo_novoquarto_int : std_logic;

    -- Sinais da FSM
    signal carrega_tempo_int, conta_int, inicializa_int, avanca_quarto_int : std_logic;
    signal carrega_cronometro_int : std_logic;

    signal fim_quarto, ultimo_quarto : std_logic;

    signal centesimos_bcd, segundos_bcd : std_logic_vector(7 downto 0);

    signal dt0, dt1, dt2, dt3 : std_logic_vector(5 downto 0);

    signal minutos_int, minutos_b : std_logic_vector(3 downto 0);
    signal segundos_b, segundos_conv, segundos_int : std_logic_vector(5 downto 0);
    signal centesimos_b : std_logic_vector(6 downto 0);
    signal quarto_int : std_logic_vector (1 downto 0);

	type ROM is array (0 to 99) of std_logic_vector (7 downto 0);
		constant conv_to_BCD : ROM:=(
		"00000000", "00000001", "00000010", "00000011", "00000100",
		"00000101", "00000110", "00000111", "00001000", "00001001",
		"00010000", "00010001", "00010010", "00010011", "00010100",
		"00010101", "00010110", "00010111", "00011000", "00011001",
		"00100000", "00100001", "00100010", "00100011", "00100100",
		"00100101", "00100110", "00100111", "00101000", "00101001",
		"00110000", "00110001", "00110010", "00110011", "00110100",
		"00110101", "00110110", "00110111", "00111000", "00111001",
		"01000000", "01000001", "01000010", "01000011", "01000100",
		"01000101", "01000110", "01000111", "01001000", "01001001",
		"01010000", "01010001", "01010010", "01010011", "01010100",
		"01010101", "01010110", "01010111", "01011000", "01011001",
		"01100000", "01100001", "01100010", "01100011", "01100100",
		"01100101", "01100110", "01100111", "01101000", "01101001",
		"01110000", "01110001", "01110010", "01110011", "01110100",
		"01110101", "01110110", "01110111", "01111000", "01111001",
		"10000000", "10000001", "10000010", "10000011", "10000100",
		"10000101", "10000110", "10000111", "10001000", "10001001",
		"10010000", "10010001", "10010010", "10010011", "10010100",
		"10010101", "10010110", "10010111", "10011000", "10011001");	
    
    type ROM_SEG is array (0 to 3) of std_logic_vector(5 downto 0);
        constant conv_seg : ROM_SEG :=(
            "000000", "001111", "011110", "101101"
        );

begin


    d1: entity work.debounce port map(
        clock=> clock,
        reset=> reset,
        key=> carga,
        debkey=> carga_int
    );

    d2: entity work.debounce port map(
        clock=> clock,
        reset=> reset,
        key=> para_continua,
        debkey=> para_continua_int
    );

    d3: entity work.debounce port map(
        clock=> clock,
        reset=> reset,
        key=> modo_novoquarto,
        debkey=> modo_novoquarto_int
    );

    fsm: entity work.fsm_controle port map(
        clock => clock,
        reset => reset, 
        para_continua => para_continua_int,
        modo_novoquarto => modo_novoquarto_int,
        carga => carga_int,
        fim_quarto => fim_quarto,
        ultimo_quarto => ultimo_quarto,
        carga_valida => '1',

        inicializa => inicializa_int,
        carrega_tempo => carrega_tempo_int,
        avanca_quarto => avanca_quarto_int,
        conta => conta_int
    );

    carrega_cronometro_int <= carrega_tempo_int or avanca_quarto_int;

    mode_set: process(clock, reset) begin
        if clock'event and clock = '1' then
            if inicializa_int = '1' then
                if modo_novoquarto = '1' then
                    mode <= NBA;
                else
                    mode <= FIBA;
                end if;
            end if;
        end if;
    end process;

    cron_basq: entity work.cron_basq_PI 
    generic map(MAXCOUNT => CLKS_POR_CENTESIMO)
    port map(
        clock => clock,
        reset => reset,
        carga => carrega_cronometro_int,
        para_continua => conta_int,
        modo_novoquarto => avanca_quarto_int,

        c_segundos => segundos_int,
        c_centesimos => "0000000", -- Centésimos sempre inicia em 0
        c_minutos => minutos_int,
        c_quarto => c_quarto,
        
        quarto => quarto_int,
        minutos => minutos_b,
        segundos => segundos_b,
        centesimos => centesimos_b
    );

    dspl_driver: entity work.dspl_drv
    port map (
        clock => clock,
        reset => reset,
        d3 => dt3,
        d2 => dt2,
        d1 => dt1,
        d0 => dt0,
        an => anodo,
        dec_ddp => DSPL_sete_seg
    );

    fim_quarto <= '1' 
    when 
        centesimos_b = "0000000" and
        segundos_b = "000000" and
        minutos_b = "0000" 
    else '0';

    ultimo_quarto <= '1' when fim_quarto = '1' and quarto_int = "11" else '0';

    quarto <= 
        "0001" when quarto_int = "00" else
        "0010" when quarto_int = "01" else
        "0100" when quarto_int = "10" else
        "1000"; 

	minutos <= minutos_b;
    segundos_conv <= conv_seg(to_integer(unsigned(c_segundos)));
    segundos_bcd <= conv_to_BCD(to_integer(unsigned(segundos_b)));
    centesimos_bcd <= conv_to_BCD(to_integer(unsigned(centesimos_b)));

    dt3 <= '1' & segundos_bcd(7 downto 4) & '1';
    dt2 <= '1' & segundos_bcd(3 downto 0) & '1';
    dt1 <= '1' & centesimos_bcd(7 downto 4) & '0';
    dt0 <= '1' & centesimos_bcd(3 downto 0) & '1';

    -- A carga de minutos é a carga padrão caso esteja no fim do quarto 
    -- e o botão de carga não é pressionado.
    minutos_int <= 
        "1010" when mode = FIBA and carga = '0' else -- 10 min
        "1100" when mode = NBA and carga = '0' else -- 12 min
        c_minutos;
    
    segundos_int <= segundos_conv when carga = '1' else (others => '0');


end Behavioral;
