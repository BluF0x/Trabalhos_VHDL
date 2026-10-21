----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:06:55 10/13/2026 
-- Design Name: 
-- Module Name:    contador_desc - Behavioral 
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

-- COMPORTAMENTO
-- > Conta de MAX_VALUE até 0 repetidamente, retorna a MAX_VALUE quando counter <= 0.

-- > Começa em 0, exceto quando 'conta' é acionado e o valor de chave_ext
-- é carregado.

-- > Possui um enable, que atualiza o contador com o clock.

entity contador_desc is
	generic (MAX_VALUE : integer := 99);
	port(
		carga_ext : in std_logic_vector(6 downto 0);
		clk, reset, enable, carga : in std_logic;
		count_out : out std_logic_vector(7 downto 0)
	);
end contador_desc;

architecture Behavioral of contador_desc is
	signal counter : integer := 0;
begin
	
	count_out <= std_logic_vector(to_unsigned(counter, count_out'length));
	
	process(clk, reset, carga) begin
		if reset = '1' then
			counter <= 0;
		elsif carga = '1' then
			if to_integer(unsigned(carga_ext ))<= MAX_VALUE then
				counter <= to_integer(unsigned(carga_ext));
			end if;
		elsif clk'event and clk = '1' then
			if enable = '1' then
				counter <= counter-1;
				if counter = 0 then
					counter <= MAX_VALUE;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

