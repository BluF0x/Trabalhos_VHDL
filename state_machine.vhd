library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Controle do cronometro. Os contadores continuam em modulos separados.
-- ck1seg e um pulso de um ciclo do clock da placa, nao um segundo clock.
entity state_machine is
    port (
        clock, reset, carga, conta : in STD_LOGIC;
        ck1seg, min_zero, seg_zero : in STD_LOGIC;
        carregar, ce_min, ce_seg, rodando, parado : out STD_LOGIC
    );
end state_machine;

architecture Behavioral of state_machine is
    type states is (IDLE, LOAD, COUNT);
    signal pst, nst : states := IDLE;
    signal terminou : STD_LOGIC := '0';
    signal zerado : STD_LOGIC;
begin
    zerado <= min_zero and seg_zero;

    -- Estado atual e memoria do LED. IDLE apos reset e IDLE apos o
    -- termino precisam de valores diferentes para parado.
    process(clock, reset)
    begin
        if reset = '1' then
            pst <= IDLE;
            terminou <= '0';
        elsif rising_edge(clock) then
            pst <= nst;
            if pst = IDLE and carga = '1' then
                terminou <= '0';
            elsif pst = COUNT and zerado = '1' then
                terminou <= '1';
            end if;
        end if;
    end process;

    -- Proximo estado, seguindo o diagrama do enunciado.
    process(pst, carga, conta, zerado)
    begin
        nst <= pst;
        case pst is
            when IDLE =>
                if carga = '1' then
                    nst <= LOAD;
                end if;
            when LOAD =>
                if conta = '1' then
                    nst <= COUNT;
                end if;
            when COUNT =>
                if zerado = '1' then
                    nst <= IDLE;
                end if;
        end case;
    end process;

    -- Uma carga ao sair de IDLE; em COUNT, segundos decrementam
    -- a cada pulso, e minutos decrementam quando segundos eram zero.
    carregar <= '1' when pst = IDLE and carga = '1' and reset = '0' else '0';
    rodando <= '1' when pst = COUNT and zerado = '0' else '0';
    ce_seg <= '1' when pst = COUNT and zerado = '0' and ck1seg = '1' else '0';
    ce_min <= '1' when pst = COUNT and zerado = '0' and
                       seg_zero = '1' and ck1seg = '1' else '0';
    parado <= terminou;
end Behavioral;
