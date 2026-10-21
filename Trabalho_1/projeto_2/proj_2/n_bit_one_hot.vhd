----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:14:35 09/30/2026 
-- Design Name: 
-- Module Name:    n_bit_one_hot - Behavioral 
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity n_bit_one_hot is
	generic (
		n : natural := 3
	);
	port (
		input : in std_logic_vector(n-1 downto 0) := (others => '0');
		output : out std_logic_vector((2**n)-1 downto 0)
	);

end n_bit_one_hot;

architecture Behavioral of n_bit_one_hot is
begin

	gen: for i in 0 to ((2**n)-1) generate
		output(i) <= '1' when unsigned(input) = i else '0';
	end generate gen;

end Behavioral;

