--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:38:48 10/13/2026
-- Design Name:   
-- Module Name:   /home/ise/VHDL/Trabalho_2/divisor_tb.vhd
-- Project Name:  Trabalho_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divisor
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY divisor_tb IS
END divisor_tb;
 
ARCHITECTURE behavior OF divisor_tb IS 
	constant max_clk : integer := 5;
	signal clock : std_logic := '0';
	signal reset : std_logic := '0';
	signal clk1seg : std_logic := '0';
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.divisor 
		GENERIC MAP ( HALF_SEC_CLK_COUNTER => max_clk )
		PORT MAP (
			clock => clock,
			reset => reset,
			clk1seg => clk1seg
		);

	reset <= '1', '0' after 10 ns, '1' after 145 ns, '0' after 155 ns;
	
	process begin
		clock <= '1';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
	end process;

END;
