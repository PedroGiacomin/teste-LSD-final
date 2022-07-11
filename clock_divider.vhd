-- clock:   50MHz   ->  100Hz   (divide por 500k)   
--          20ns    ->  10ms    (multiplica por 500k)

library ieee;
use ieee.std_logic_1164.all;

entity clock_divider is
    port (
        clk_in : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end clock_divider;

architecture RTL of clock_divider is
    signal temporal: STD_LOGIC  :=  '0';
    signal counter : integer range 0 to 249999 := 0;    
begin
    process (clk_in) 
    begin
        if rising_edge(clk_in) then
            -- Inverte o clock_out a cada 250k bordas de subida, i.e, cria um clock de 10ms de periodo
            if (counter = 249999) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end RTL;