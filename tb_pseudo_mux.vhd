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
        S       : in    std_logic; -- control input
		  T			: in 	std_logic; -- control input
        Q       : out   std_logic_vector  -- data output
    );
	
end component;

signal T : std_logic;
signal S : std_logic;
signal Q : std_logic_vector(3 downto 0);
signal CLOCK : std_logic := '0';
signal RESET : std_logic := '0';


begin
instancia_pseudo_mux: pseudo_mux port map(
	RESET=>RESET, CLOCK=>CLOCK, S=>S, Q=>Q, T=>T 
);
	T <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 50 ns, '1' after 60 ns;
	S <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 50 ns, '1' after 60 ns;
	CLOCK <= not CLOCK after 20 ns; 
	RESET <=  '1' after 70 ns, '0' after 80 ns;
end teste;