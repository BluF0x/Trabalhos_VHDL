--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:21:59 10/15/2026
-- Design Name:   
-- Module Name:   /home/ise/VHDL/Trabalho_2/contador_desc_tb.vhd
-- Project Name:  Trabalho_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: contador_desc
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
USE IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY contador_desc_tb IS
END contador_desc_tb;
 
ARCHITECTURE behavior OF contador_desc_tb IS 
	constant MAX_VALUE : integer := 10;
	signal carga_ext : std_logic_vector(6 downto 0) := (others => '0');
	signal clk, reset, enable, carga : std_logic := '0';
	signal output : std_logic_vector(7 downto 0) := (others => '0');
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.contador_desc 
	GENERIC MAP ( MAX_VALUE => MAX_VALUE)
	PORT MAP (
          carga_ext => carga_ext,
          clk => clk,
          reset => reset,
          enable => enable,
          carga => carga,
          output => output
        );

	reset <= '1', '0' after 15 ns;
	
	carga <= '0', '1' after 25 ns, '0' after 35 ns;
	
	enable <= '0', '1' after 40 ns;
	
	carga_ext <= "0000100";

	clock_process: process begin
		clk <= '1';
		wait for 10 ns;
		
		clk <= '0';
		wait for 10 ns;
	end process;




END;
