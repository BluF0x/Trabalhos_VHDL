----------------------------------------------------------------------------------
-- Cronometro decrescente setado pelo usuario
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity cronometro is
	GENERIC (CLOCK_FREQ : integer := 50_000_000);
	port ( carga, conta, reset, clock : in std_logic;
			chave : in std_logic_vector(6 downto 0);
			parado : out std_logic;
			an : out std_logic_vector(3 downto 0);
			dec_ddp : out std_logic_vector(7 downto 0)
			);
end cronometro;

architecture Behavioral of cronometro is
	type STATES is (IDLE, LOAD, COUNT);

	signal clk1seg, ce_seg, ce_min, hab_carga : std_logic;
	signal min_zero, seg_zero : std_logic;
	signal minutos, segundos : std_logic_vector(7 downto 0);
	signal segundos_bcd, minutos_bcd : std_logic_vector(7 downto 0);
	signal state_out : std_logic_vector(1 downto 0 );
	signal nsp, pst : STATES;
	signal td3, td2, td1, td0 : std_logic_vector(5 downto 0);
	
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


begin

	divisor_clk: entity work.divisor 
		generic map (HALF_SEC_CLK_COUNTER => CLOCK_FREQ /2)
		port map (
			clock => clock,
			reset => reset,
			clk1seg => clk1seg
		);

	state_machine: entity work.state_machine
		port map (
			clock => clk1seg,
			reset => reset,
			carga => carga,
			conta => conta,
			min_zero => min_zero,
			seg_zero => seg_zero,
			pst => state_out,
			parado => parado
		);

	contador_seg: entity work.contador_desc 
		generic map (MAX_VALUE => 59)
		port map(
			carga_ext => (others => '0'),
			clk => clk1seg,
			reset => reset,
			enable => ce_seg,
			carga => hab_carga,
			count_out => segundos
		);

	contador_min: entity work.contador_desc 
		generic map (MAX_VALUE => 99)
		port map(
			carga_ext => chave,
			clk => clk1seg,
			reset => reset,
			enable => ce_min,
			carga => hab_carga,
			count_out => minutos
		);

		
	-- Converte saída da state machine para enums
	pst <= IDLE when state_out = "00" else 
		   LOAD when state_out = "01" else COUNT;

	-- Habilita contagem
	ce_min <= '1' when segundos = "00000000" and pst = COUNT else '0';
	ce_seg <= '1' when pst = COUNT else '0';
	 -- Se carga é ligada diretamente é possivel carregar um novo valor no estado COUNT e LOAD.
	 -- Para seguir estritamente a especificação, um numero apenas pode ser carregado no estado IDLE.
	hab_carga <= '1' when carga = '1' and pst = IDLE else '0';
	
	min_zero <= '1' when minutos = "00000000" else '0';
	seg_zero <= '1' when segundos = "00000001" else '0'; --No proximo clock muda o estado, então é necessario ativar no 1 s, senão ele volta ao num maximo

	-- Conversão de binario
	segundos_bcd <= conv_to_BCD(to_integer(unsigned(segundos)));
	minutos_bcd <= conv_to_BCD(to_integer(unsigned(minutos)));
	
	td3 <= '1' & minutos_bcd(7 downto 4) & '1';
	td2 <= '1' & minutos_bcd(3 downto 0) & '0';
	td1 <= '1' & segundos_bcd(7 downto 4) & '1';
	td0 <= '1' & segundos_bcd(3 downto 0) & '1';
	

	

	display_driver: entity work.dspl_drv
	port map(
		clock => clock,
		reset => reset,
		d3 => td3,
		d2 => td2,
		d1 => td1,
		d0 => td0,
		an => an,
		dec_ddp => dec_ddp		
	);

end Behavioral;

