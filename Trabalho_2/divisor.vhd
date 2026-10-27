library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor is
	generic( HALF_SEC_CLK_COUNTER : integer := 25_000_000);
	port ( 
		clock, reset : in std_logic;
		clk1seg : out std_logic);
		
end divisor;

architecture Behavioral of divisor is
	signal counter : integer := 0;
	signal temp : std_logic := '0';
begin

	clk1seg <= temp;
	process(reset, clock) begin
		if reset='1' then
			temp <= '0';
			counter <= 0;
		elsif clock'event and clock = '1' then
			if counter = HALF_SEC_CLK_COUNTER-1 then 
				if temp = '1' then 
					temp <= '0';
				else 
					temp <= '1';
				end if;
				counter <= 0;
			else 
				counter <= counter+1;
			end if;
		end if;
	end process;

end Behavioral;

