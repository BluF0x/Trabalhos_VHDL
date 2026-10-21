--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:23:39 09/24/2026
-- Design Name:   
-- Module Name:   /home/ise/VHDL/Template/template/one_hot_tb.vhd
-- Project Name:  template
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: one_hot_og
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.numeric_std.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY one_hot_tb IS
END one_hot_tb;
 
ARCHITECTURE behavior OF one_hot_tb IS  
	constant num: integer := 3;
	signal input: std_logic_vector (num-1 downto 0) := "000";
	signal output, output_2: std_logic_vector ((2**num)-1 downto 0);
BEGIN
	UUT: entity work.n_bit_d
	generic map (N => num)
	port map (input => input,
				output => output);
			
	UUT_2: entity work.n_bit_one_hot
	generic map (n => num)
	port map (input => input,
				 output => output_2);
			
				
		
	process (input)
	begin
		if (input = "111") then
			input <= "000" after 10 ns;
		else
			input <= std_logic_vector(unsigned(input) + "001") after 10 ns;
		end if;
	end process;
	
END; 

-- no projeto 4, guardar o sinal de 8 bits em um registrador interno, o valor sendo transmitido pode mudar depois de "send" abaixar
-- colocar sinais internos no projeto 4 (da pra fazer isso no isim)
