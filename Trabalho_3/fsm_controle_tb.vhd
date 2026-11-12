library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_controle_tb is
end fsm_controle_tb;

architecture fsm_controle_tb of fsm_controle_tb is
    signal clock : STD_LOGIC := '0';
    signal reset, para_continua, modo_novoquarto, carga : STD_LOGIC;
    signal fim_quarto, ultimo_quarto, carga_valida : STD_LOGIC;

    signal inicializa, carrega_tempo, avanca_quarto, conta : STD_LOGIC;
    signal estado_dbg : STD_LOGIC_VECTOR(1 downto 0);
begin

    uut : entity work.fsm_controle
        port map (
            clock => clock, reset => reset,
            para_continua => para_continua,
            modo_novoquarto => modo_novoquarto,
            carga => carga,
            fim_quarto => fim_quarto,
            ultimo_quarto => ultimo_quarto,
            carga_valida => carga_valida,
            inicializa => inicializa,
            carrega_tempo => carrega_tempo,
            avanca_quarto => avanca_quarto,
            conta => conta
        );


	clock <= not clock after 10 ns;

    reset <= '1', '0' after 20 ns,
             '1' after 560 ns, '0' after 580 ns;
				 
    para_continua <= '0', '1' after 40 ns, '0' after 60 ns,
                         '1' after 80 ns, '0' after 100 ns,
                         '1' after 120 ns, '0' after 140 ns,
                         '1' after 220 ns, '0' after 240 ns,
                         '1' after 300 ns, '0' after 320 ns,
                         '1' after 520 ns, '0' after 540 ns;

    modo_novoquarto <= '0', '1' after 160 ns, '0' after 180 ns,
                           '1' after 260 ns, '0' after 280 ns,
                           '1' after 360 ns, '0' after 380 ns;

    carga <= '0', '1' after 160 ns, '0' after 180 ns,
                  '1' after 400 ns, '0' after 420 ns,
                  '1' after 440 ns, '0' after 460 ns;

    fim_quarto <= '0', '1' after 200 ns, '0' after 280 ns,
                      '1' after 340 ns, '0' after 460 ns;

    ultimo_quarto <= '0', '1' after 340 ns, '0' after 460 ns;

    carga_valida <= '1', '0' after 400 ns, '1' after 440 ns;


end fsm_controle_tb;
