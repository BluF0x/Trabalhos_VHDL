----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:00:33 11/08/2026 
-- Design Name: 
-- Module Name:    top_cron_basq - Behavioral 
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
USE IEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_cron_basq is
    port (
        clock, carga, modo_novoquarto, para_continua, reset : in std_logic;
        c_minutos : in std_logic_vector(3 downto 0);
        c_quarto, c_segundos : in std_logic_vector(1 downto 0);
        anodo, minutos, quarto : out std_logic_vector(3 downto 0);
        DSPL_sete_seg : out std_logic_vector(7 downto 0)
    )
end top_cron_basq;

architecture Behavioral of top_cron_basq is
    constant CKS_POR_CENTESIMO : integer := 250_000;

    signal carga_int, para_continua_int, modo_novoquarto_int : std_logic;
    signal fim_quarto, ultimo_quarto : std_logic;
    signal segundo_conv : std_logic_vector(5 downto 0);

	type ROM is array (0 to 99) of std_logic_vector (7 downto 0);
		constant conv_to_BCD : ROM:=(
		"00000000", "00000001", "00000010", "00000011", "00000100",
		"00000101", "00000110", "00000111", "00001000", "00001001",
		"00010000", "00010001", "00010010", "00010011", "00010100",
		"00010101", "00010110", "00010111", "00011000", "00011001",
		"00100000", "00100001", "00100010", "00100011", "00100100",
		"00100101", "00100110", "00100111", "00101000", "00101001",
		"00110000", "00110001", "00110010", "00110011", "00110100",
		"00110101", "00110110", "00110111", "00111000", "00111001",
		"01000000", "01000001", "01000010", "01000011", "01000100",
		"01000101", "01000110", "01000111", "01001000", "01001001",
		"01010000", "01010001", "01010010", "01010011", "01010100",
		"01010101", "01010110", "01010111", "01011000", "01011001",
		"01100000", "01100001", "01100010", "01100011", "01100100",
		"01100101", "01100110", "01100111", "01101000", "01101001",
		"01110000", "01110001", "01110010", "01110011", "01110100",
		"01110101", "01110110", "01110111", "01111000", "01111001",
		"10000000", "10000001", "10000010", "10000011", "10000100",
		"10000101", "10000110", "10000111", "10001000", "10001001",
		"10010000", "10010001", "10010010", "10010011", "10010100",
		"10010101", "10010110", "10010111", "10011000", "10011001");	
    
    type ROM_SEG is array (0 to 3) of std_logic_vector(5 downto 0);
        constant conv_seg : ROM_SEG :=(
            "000000", "001111", "011110", "101101"
        );

begin

    segundo_conv => conv_seg(c_segundos);

    d1: entity work.debounce port map(
        clock=> clock,
        reset=> reset,
        key=> carga,
        debkey=> carga_int
    );

    d2: entity work.debounce port map(
        clock=> clock,
        reset=> reset,
        key=> para_continua,
        debkey=> para_continua_int
    );

    d3: entity work.debounce port map(
        clock=> clock,
        reset=> reset,
        key=> modo_novoquarto,
        debkey=> modo_novoquarto_int
    );

    fsm: entity work.fsm_controle port map(
        clock => clock,
        reset => reset, 
        para_continua => para_continua_int,
        modo_novoquarto => modo_novoquarto_int,
        carga => carga_int,
        carga_valida => '1',
    );

    cron_basq: entity work.cron_basq_PI 
    generic map(CKS_POR_CENTESIMO => CKS_POR_CENTESIMO )
    port map(
        clock => clock,
        reset => reset,
        carga => 
        c_segundos 
    )


end Behavioral;
