library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity state_machine_tb is
end state_machine_tb;

architecture state_machine_tb of state_machine_tb is
    signal clock : STD_LOGIC := '0';
    signal reset, carga, conta : STD_LOGIC;
    signal min_zero, seg_zero : STD_LOGIC;
    signal pst : STD_LOGIC_VECTOR(1 downto 0);
    signal parado : STD_LOGIC;
begin
    uut : entity work.state_machine
        port map (
            clock => clock, reset => reset, carga => carga, conta => conta,
            min_zero => min_zero, seg_zero => seg_zero,
            pst => pst, parado => parado
        );

    clock <= not clock after 5 ns;

    reset <= '1', '0' after 12 ns;
    carga <= '0', '1' after 12 ns, '0' after 16 ns,
             '1' after 36 ns, '0' after 46 ns;
    conta <= '0', '1' after 16 ns, '0' after 26 ns;
    min_zero <= '0', '1' after 28 ns;
    seg_zero <= '0', '1' after 26 ns, '0' after 27 ns,
                '1' after 28 ns;
end state_machine_tb;
