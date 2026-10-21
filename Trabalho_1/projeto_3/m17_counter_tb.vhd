library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity m17_counter_tb is
end m17_counter_tb;

architecture TB_architecture of m17_counter_tb is
		signal clktb, resettb : STD_LOGIC;
		signal counter : STD_LOGIC_VECTOR (4 downto 0);

begin
	UUT : entity work.m17_counter
		port map(clk => clktb , reset => resettb, count => counter);
	
		clktb <= '0', not clktb after 5 ns;
		resettb <= '0', '1' after 100 ns, '0' after 110 ns;
	
end TB_architecture;