library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cron_basq_PI_tb is
end cron_basq_PI_tb;


architecture Behavioral of cron_basq_PI_tb is
    signal clock : std_logic := '0';
    signal reset, carga, para_continua, modo_novoquarto : std_logic;
    signal c_quarto, quarto : std_logic_vector(1 downto 0);
    signal c_minutos, minutos : std_logic_vector(3 downto 0);
    signal c_segundos, segundos : std_logic_vector(5 downto 0);
    signal c_centesimos, centesimos : std_logic_vector(6 downto 0);
begin

    uut: entity work.cron_basq_PI
			generic map(MAXCOUNT => 2)
         port map (
             para_continua   => para_continua,
             modo_novoquarto => modo_novoquarto,
             carga           => carga,
             clock           => clock,
             reset           => reset,
             c_quarto        => c_quarto,
             c_minutos       => c_minutos,
             c_segundos      => c_segundos,
             c_centesimos    => c_centesimos,
             quarto          => quarto,
             minutos         => minutos,
             segundos        => segundos,
             centesimos      => centesimos
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
        c_quarto <= "00";
        c_minutos <= "0001";
        c_segundos <= "000011";
        c_centesimos <= "0000000";

        wait for 20 ns;
        reset <= '0';

        wait for 10 ns;
        carga <= '1';
        wait for 10 ns;
        carga <= '0';

        wait for 10 ns;
        para_continua <= '1';

        wait for 12 us;
        modo_novoquarto <= '1';
        wait for 10 ns;
        modo_novoquarto <= '0';

        wait;
    end process;
end Behavioral;
