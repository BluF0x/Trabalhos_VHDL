library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_controle is
    port (
        clock, reset : in STD_LOGIC;
        para_continua, modo_novoquarto, carga : in STD_LOGIC;
        fim_quarto, ultimo_quarto, carga_valida : in STD_LOGIC;

        inicializa, carrega_tempo, avanca_quarto, conta : out STD_LOGIC
        --estado_dbg : out STD_LOGIC_VECTOR(1 downto 0)
    );
end fsm_controle;

architecture fsm_controle of fsm_controle is
    type states is (MODE_SET, IDLE, COUNTING, STOPPED);
    signal estado_dbg : STD_LOGIC_VECTOR(1 downto 0);
    signal present, prox : states;

    signal parado, carregar, avancar, iniciar : STD_LOGIC;
begin

    parado <= '1' when present = IDLE or present = STOPPED else '0';

    carregar <= not reset and parado and carga and carga_valida;

    avancar <= not reset and parado and not carga
               and modo_novoquarto and fim_quarto and not ultimo_quarto;

    iniciar <= not reset and parado and not carga
               and not modo_novoquarto and para_continua and not fim_quarto;

    process(clock, reset)
    begin
        if reset = '1' then
            present <= MODE_SET;
        elsif rising_edge(clock) then
            present <= prox;
        end if;
    end process;

    process(present, iniciar, carregar, avancar, para_continua, fim_quarto)
    begin
        prox <= present;

        case present is
            when MODE_SET =>
                prox <= IDLE;

            when IDLE =>
                if iniciar = '1' then
                    prox <= COUNTING;
                end if;

            when COUNTING =>
                if para_continua = '1' or fim_quarto = '1' then
                    prox <= STOPPED;
                end if;

            when STOPPED =>
                if carregar = '1' or avancar = '1' then
                    prox <= IDLE;
                elsif iniciar = '1' then
                    prox <= COUNTING;
                end if;
        end case;
    end process;

    inicializa <= '1' when present = MODE_SET and reset = '0' else '0';

    carrega_tempo <= carregar;
    avanca_quarto <= avancar;

    conta <= '1' when present = COUNTING and reset = '0'
                 and para_continua = '0' and fim_quarto = '0' else '0';


--    estado_dbg <= "00" when present = MODE_SET else
--                  "01" when present = IDLE else
--                  "10" when present = COUNTING else
--                  "11";

end fsm_controle;
