library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity m17_counter is
	port (clk, reset : in STD_LOGIC;
		count : out STD_LOGIC_VECTOR (4 downto 0));
end m17_counter;

architecture m17_counter of m17_counter is
signal int_count : unsigned(4 downto 0) := (others => '0');
begin
	process(clk, reset)
	begin
		 if reset = '1' then
			  int_count <= (others => '0');
		 elsif rising_edge(clk) then
			  if int_count = 16 then
					int_count <= (others => '0');
			  else
					int_count <= int_count + 1;
			  end if;
		 end if;
	end process;
	count <= std_logic_vector(int_count);
end m17_counter;
