----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:05:57 10/13/2026 
-- Design Name: 
-- Module Name:    divisor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divisor is
	generic( HALF_SEC_CLK_COUNTER : integer := 25_000_000);
	port ( 
		clock, reset : in std_logic;
		clk1seg : out std_logic);
		
end divisor;

architecture Behavioral of divisor is
	signal counter : integer := 0;
begin

	process(reset, clock) begin
		if reset='1' then
			clk1seg <= '0';
			counter <= 0;
		elsif clock'event and clock = '1' then
			if counter = HALF_SEC_CLK_COUNTER-1 then 
				clk1seg <= '1';
				counter <= 0;
			else 
				counter <= counter+1;
				clk1seg <= '0';
			end if;
		end if;
	end process;

end Behavioral;

