library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cronometro_tb is
end cronometro_tb;

architecture cronometro_tb of cronometro_tb is
    signal clock : std_logic := '1';
    signal reset, carga, conta, parado : std_logic;
    signal chave: std_logic_vector(6 downto 0);
begin
clock <= not clock after 10 ns;
    reset <= '1', '0' after 73 ns;
    carga <= '0', '1' after 133 ns, '0' after 425 ns;
    conta <= '0', '1' after 543 ns, '0' after 925 ns;
    chave <= "0000101";
	 
    uut : entity work.cronometro
    generic map ( CLOCK_FREQ => 4 ) -- para simulação utilizar um divisor menor que 25.000.000
    port map (
        clock => clock,
        reset => reset,
        carga => carga,
        conta => conta,
        chave => chave,
        parado => parado,
        an => open, -- Não é necessário na simulação ver an e dec_ddp, sua interpretação
        dec_ddp => open); -- em binário é difícil. Usem a palavra chave open do VHDL
end cronometro_tb; -- para deixar estes pinos em aberto, ou seja, desconectados