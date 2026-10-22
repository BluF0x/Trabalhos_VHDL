library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity state_machine is
    port (
        clock, reset, carga, conta : in STD_LOGIC;
        min_zero, seg_zero : in STD_LOGIC;
        pst : out STD_LOGIC_VECTOR(1 downto 0);
        parado : out STD_LOGIC
    );
end state_machine;

architecture state_machine of state_machine is
    type states is (IDLE, LOAD, COUNT);
    signal present, prox : states := IDLE;
    signal terminou : STD_LOGIC := '0';
    signal zerado : STD_LOGIC;
begin
    zerado <= min_zero and seg_zero;

    process(clock, reset)
    begin
        if reset = '1' then
            present <= IDLE;
            terminou <= '0';
        elsif rising_edge(clock) then
            present <= prox;
            if present = IDLE and carga = '1' then
                terminou <= '0';
            elsif present = COUNT and zerado = '1' then
                terminou <= '1';
            end if;
        end if;
    end process;

    process(present, carga, conta, zerado)
    begin
        prox <= present;
        case present is
            when IDLE =>
                if carga = '1' then
                    prox <= LOAD;
                end if;
            when LOAD =>
                if conta = '1' then
                    prox <= COUNT;
                end if;
            when COUNT =>
                if zerado = '1' then
                    prox <= IDLE;
                end if;
        end case;
    end process;

    -- 00 = IDLE, 01 = LOAD, 10 = COUNT.
    pst <= "00" when present = IDLE else
           "01" when present = LOAD else
           "10";
    parado <= '1' when terminou = '1' else '0';
end state_machine;
