----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:22:42 09/24/2026 
-- Design Name: 
-- Module Name:    one_hot_og - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity n_bit_d is
	generic (N: integer := 2);
	port (input: in std_logic_vector (N-1 downto 0);
			output: out std_logic_vector ((2**N)-1 downto 0));
end entity n_bit_d;
	architecture n_bit_d of n_bit_d is
begin
	process (input)
		variable int_input : integer;
	begin
		output <= (others => '0');
		int_input := to_integer(unsigned(input));
		output(int_input) <= '1';
		end process;
end architecture n_bit_d;