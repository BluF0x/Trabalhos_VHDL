library IEEE;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity cron_basq_PI is
    generic (MAXCOUNT : integer := CKS_POR_CENTESIMO)
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
    signal ce_ms, ce_seg, ce_min, ce_q, clk_ms : std_logic;
begin

    ce_ms <= '1' when para_continua = '0' and clk_ms = '1';
    ce_seg <= '1' when para_continua = '0' and centesimos = "00000000";
    ce_min <= '1' when para_continua = '0'and segundos = "000000";

    -- Reutilizado do T2
    cont_1_ms: entity work.divisor
    generic map(HALF_SEC_CLK_COUNTER => 250_000);
    port map(
        clock => clock,
        reset => reset,
        clk1seg => clk_ms
    )

    cont_ms: entity work.contador_desc 
    generic map(MAX_VALUE := 99);
    port map (
        clock => clock,
        reset => reset,
        carga_ext => c_centesimos, 
        carga => carga,
        enable => ce_ms,
        count_out => centesimos
    )

    cont_s: entity work.contador_desc 
    generic map(MAX_VALUE := 59);
    port map (
        clock => clock,
        reset => reset,
        carga_ext => "0" & c_segundos, 
        carga => carga,
        enable => ce_seg,
        count_out => segundos
    )

    cont_m: entity work.contador_desc 
    generic map(MAX_VALUE := 16);
    port map (
        clock => clock,
        reset => reset,
        carga_ext => "00" & c_minutos, 
        carga => carga,
        enable => ce_min,
        count_out => minutos
    )

    conta_quarto: process(clk, reset) begin
        if reset then 
            quarto = "00";
        elsif clock'event and clock = '1' then 
            if centesimos = "00000000" and segundos = "000000" and minutos = "0000" then
                quarto <= std_logic_vector(unsigned(quarto) +1);
            end if;
        end if;
    end process;


end Behavioral