
-- pseudo_mux - A Finite State Machine that mimics the behavior of mux
-- Copyright (C) 2018  Digital Systems Group - UFMG
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, see <https://www.gnu.org/licenses/>.
--

library ieee;
use ieee.std_logic_1164.all;

entity pseudo_mux is
    port (
        RESET   : in    std_logic; -- reset input
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control inputs
        Q       : out   std_logic_vector(3 downto 0)  -- data output
    );
end pseudo_mux;

architecture arch of pseudo_mux is
	type state_type is (S0, S1, S2, S3);
	signal s_atual, s_prox : state_type;
   
begin
   
	process (S, s_atual)
		begin
			case s_atual is
				when S0 =>
					Q <= "0001";
					if S = '0'  then
						s_prox <= S0;
					else
						s_prox <= S1;
					end if;
				when S1 =>
					Q <= "0010";
					if S = '0' then
						s_prox <= S1;
					else
						s_prox <= S2;
					end if;
				when S2 =>
					Q <= "0100";
					if S = '0' then
						s_prox <= S2;
					else
						s_prox <= S3;	
					end if;	
				when S3 =>
					Q <= "1000";
					if S = '0' then
						s_prox <= S3;
					else
						s_prox <= S0;
					end if;
			end case;
		end process;
	
	process (CLOCK, RESET)
		begin
			if reset = '1' then
				s_atual <= S0;
			elsif rising_edge(CLOCK) then
				s_atual <= s_prox;
			end if;
		end process;
end arch;
