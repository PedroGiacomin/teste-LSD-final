library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_pseudo_mux is
end tb_pseudo_mux;

architecture teste of tb_pseudo_mux is


component pseudo_mux is

    port (
        RESET   : in    std_logic; -- reset input
        CLOCK   : in    std_logic; -- clock input
        botao   : in    std_logic; -- control input
        Q       : out   std_logic_vector;  -- data output
		clock_out	:	out	std_logic
    );
	
end component;

signal botao : std_logic    :=  '0';
signal Q : std_logic_vector(3 downto 0);
signal CLOCK : std_logic := '1';
signal RESET : std_logic := '0';
signal clock_out	:	std_logic;

begin
instancia_pseudo_mux: pseudo_mux port map(
	RESET=>RESET, CLOCK=>CLOCK, botao=>botao, Q=>Q, clock_out => clock_out
);
	botao <= '1' after 100 ms, '0' after 200 ms, '1' after 400 ms, '0' after 500 ms; -- Pressiona o botao por 0,1 segundo e solta 
	CLOCK <= not CLOCK after 10 ns; 
	RESET <=  '1' after 70 ns, '0' after 80 ns;
end teste;