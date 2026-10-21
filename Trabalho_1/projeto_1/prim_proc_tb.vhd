library IEEE;
use IEEE.std_logic_1164.all;

entity prim_proc_tb is
end prim_proc_tb;

architecture TB_architecture of prim_proc_tb is
	signal aa, ab, ba, bb : std_logic;
	signal ctrl_tb : std_logic_vector(1 downto 0);
	signal sai_tb : std_logic;
begin
UUT: entity work.prim_proc
		port map(in1 => aa, in2 => ab, in3 => ba, in4 => bb, ctrl => ctrl_tb, sai => sai_tb);
		
		ctrl_tb <= "00", "01" after 20 ns, "10" after 40 ns, "11" after 60 ns, "00" after 80 ns;
		aa <= '0', '1' after 10 ns, '0' after 20 ns;
		ab <= '0', '1' after 30 ns, '0' after 40 ns;
		ba <= '0', '1' after 50 ns, '0' after 60 ns;
		bb <= '0', '1' after 70 ns, '0' after 80 ns;
		
end TB_architecture;