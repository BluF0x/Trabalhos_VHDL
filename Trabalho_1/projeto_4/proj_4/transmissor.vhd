----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:12:35 09/25/2026 
-- Design Name: 
-- Module Name:    transmissor - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity transmissor is
	port( clock, reset, send : in std_logic;
			busy, linha : out std_logic;
			palavra : std_logic_vector(7 downto 0));
end transmissor;

architecture Behavioral of transmissor is
	signal buf : std_logic_vector(7 downto 0); 
	type STATE is (idle, sending, finishing);
	signal current_state : STATE := idle;
begin

	busy <= '0' when (current_state = idle or current_state = finishing) else '1' when current_state = sending;
	
	process(clock, reset)
		variable current_bit : integer := 8; -- Conta de 8 a 0, enviando o bit armazenado no buffer
	begin
		if clock'event and clock='1' then
			if (current_state = idle) then 
				if ((send='1') and (current_state /= sending)) then 
					current_state <= sending;
					buf <= palavra;
					linha <= '0';
				else 
					linha <= '1';
				end if;
			elsif (current_state = sending) then
				if ( current_bit = 0) then 
					current_bit := 8;
					linha <= '0';
					current_state <= finishing;
				else 
					current_bit := current_bit-1;
					linha <= buf(current_bit);
				end if;
			elsif (current_state = finishing) then 
				current_state <= idle;
				linha <= '1';
			end if;
		end if;
		
		if reset = '1' then
			current_state <= idle;
			linha <= '1';
			buf <= (others => '0');
			current_bit := 8;
		end if;
	end process;
	
end Behavioral;

