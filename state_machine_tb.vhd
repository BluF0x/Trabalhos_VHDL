library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity state_machine_tb is
end state_machine_tb;

architecture state_machine_tb of state_machine_tb is
    signal clock : STD_LOGIC := '0';
    signal reset, carga, conta : STD_LOGIC;
    signal ck1seg, min_zero, seg_zero : STD_LOGIC;
    signal carregar, ce_min, ce_seg, rodando, parado : STD_LOGIC;
begin
    uut : entity work.state_machine
        port map (
            clock => clock, reset => reset, carga => carga, conta => conta,
            ck1seg => ck1seg, min_zero => min_zero, seg_zero => seg_zero,
            carregar => carregar, ce_min => ce_min, ce_seg => ce_seg,
            rodando => rodando, parado => parado
        );

    clock <= not clock after 5 ns;

    reset <= '1', '0' after 12 ns;
    carga <= '0', '1' after 12 ns, '0' after 16 ns, '1' after 36 ns, '0' after 46 ns;
    conta <= '0', '1' after 16 ns, '0' after 26 ns;

    ck1seg   <= '0', '1' after 26 ns, '0' after 28 ns;
    min_zero <= '0', '1' after 28 ns;
    seg_zero <= '0', '1' after 26 ns, '0' after 27 ns, '1' after 28 ns;
end state_machine_tb;
