----------------------------------------------------------------------- 
-- Cronometro principal 
----------------------------------------------------------------------- 
-- DESC:
-- O cronometro principal que conta centésimos de segundos, segundos,
-- minutos e quartos.  
-- 
-- Inputs:
-- para_continua: Quando em '1', para o cronometro
-- modo_novoquarto: Quando em '1', adiciona +1 ao quarto. 
----------------------------------------------------------------------- 
library IEEE;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity cron_basq_PI is
    generic (MAXCOUNT : integer := 250000);
    port (
        para_continua, modo_novoquarto, carga, clock, reset : in STD_LOGIC;
        c_quarto : in STD_LOGIC_VECTOR (1 downto 0);
        c_minutos : in STD_LOGIC_VECTOR (3 downto 0);
        c_segundos : in STD_LOGIC_VECTOR (5 downto 0);
        c_centesimos : in STD_LOGIC_VECTOR (6 downto 0);

        quarto : out STD_LOGIC_VECTOR (1 downto 0); -- 4 leds
        minutos : out STD_LOGIC_VECTOR (3 downto 0); -- 4 leds
        segundos : out STD_LOGIC_VECTOR (5 downto 0); -- 2 dspls
        centesimos : out STD_LOGIC_VECTOR (6 downto 0) -- 2 dspls
    );
end cron_basq_PI;

architecture Behavioral of cron_basq_PI is
    signal ce_ms, ce_seg, ce_min, clk_ms : std_logic;
    signal centesimos_int, segundos_int, minutos_int : STD_LOGIC_VECTOR (7 downto 0);
    signal c_int_minutos, c_int_segundos : STD_LOGIC_VECTOR (6 downto 0);
	 signal quarto_int : STD_LOGIC_VECTOR(1 downto 0);
begin

	-- contador_desc usa 7 bits de entrada de carga
	c_int_minutos <= "000" & c_minutos;
	c_int_segundos <= '0' & c_segundos;
	
	quarto <= quarto_int;

    -- Reutilizado do T2
    cont_1_ms: entity work.divisor
    generic map(HALF_SEC_CLK_COUNTER => MAXCOUNT)
    port map(
        clock => clock,
        reset => reset,
        clk1seg => clk_ms
    );

   
    cont_ms: entity work.contador_desc 
    generic map(MAX_VALUE => 99)
    port map (
        clk => clk_ms,
        reset => reset,
        carga_ext => c_centesimos, 
        carga => carga,
        enable => ce_ms,
        count_out => centesimos_int
    );

    cont_s: entity work.contador_desc 
    generic map(MAX_VALUE => 59)
    port map (
        clk => clk_ms,
        reset => reset,
        carga_ext => c_int_segundos, 
        carga => carga,
        enable => ce_seg,
        count_out => segundos_int
    );

    cont_m: entity work.contador_desc 
    generic map(MAX_VALUE => 16)
    port map (
        clk => clk_ms,
        reset => reset,
        carga_ext => c_int_minutos, 
        carga => carga,
        enable => ce_min,
        count_out => minutos_int
    );
	 
	 segundos <= segundos_int(5 downto 0);
	 minutos  <= minutos_int (3 downto 0);
	 centesimos <= centesimos_int (6 downto 0);
	 
	 ce_ms <= '1' when para_continua = '1' else '0';
    ce_seg <= '1' when para_continua = '1' and centesimos_int = "00000000" else '0';
    ce_min <= '1' when para_continua = '1' and segundos_int = "00000000" and centesimos_int = "00000000" else '0';


    -- A validação de modo_novoquarto é feita fora do módulo
    conta_quarto: process(clock, modo_novoquarto, reset) begin
        if reset = '1' then 
            quarto_int <= "00";
		  elsif carga = '1' then
				quarto_int <= c_quarto;
        elsif clock'event and clock = '1' then 
            if modo_novoquarto = '1' then
                quarto_int <= std_logic_vector(unsigned(quarto_int) +1);
            end if;
        end if;
    end process;

end Behavioral;