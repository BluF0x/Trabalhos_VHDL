library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_cron_basq_tb is
end top_cron_basq_tb;

architecture Behavioral of top_cron_basq_tb is
	constant CLK_COUNT : integer := 2;
    constant DIV_R : integer := 1;
    signal clock : std_logic := '0';
    signal carga, modo_novoquarto, para_continua, reset : std_logic := '0';
    signal c_minutos : std_logic_vector(3 downto 0) := "1010";
    signal c_quarto : std_logic_vector(1 downto 0) := "00";
    signal c_segundos : std_logic_vector(1 downto 0) := "01";
    signal anodo, minutos, quarto : std_logic_vector(3 downto 0);
    signal DSPL_sete_seg : std_logic_vector(7 downto 0);
begin
    uut: entity work.top_cron_basq
        generic map (CLKS_POR_CENTESIMO => CLK_COUNT, DIV_RATE => DIV_R)
        port map (
            clock => clock,
            carga => carga,
            modo_novoquarto => modo_novoquarto,
            para_continua => para_continua,
            reset => reset,
            c_minutos => c_minutos,
            c_quarto => c_quarto,
            c_segundos => c_segundos,
            anodo => anodo,
            minutos => minutos,
            quarto => quarto,
            DSPL_sete_seg => open
        );

    clock_process: process
    begin
        clock <= '0';
        wait for 5 ns;
        clock <= '1';
        wait for 5 ns;
    end process;

    stimulus_process: process
    begin
        reset <= '1';
        carga <= '0';
        para_continua <= '0';
        modo_novoquarto <= '0';

        wait for 20 ns;
        reset <= '0';


        wait for 20 ns;
        para_continua <= '1';
        wait for 20 ns;
        para_continua <= '0';

        wait for 3 ms;

        modo_novoquarto <= '1';
        wait for 20 ns;
        modo_novoquarto <= '0';

        wait for 20 ns;
        para_continua <= '1';
        wait for 20 ns;
        para_continua <= '0';

        wait;
    end process;
end Behavioral;
