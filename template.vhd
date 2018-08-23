library ieee;
use ieee.std_logic_1164.all;

entity template is 
	
	generic(n: positive := 8);
	
	port(
			--control input
			clock,reset: in std_logic;
			load: in std_logic;
			--data input
			entrada: in std_logic_vector(n-1 downto 0);
			--control output
			--data output
			saida: out std_logic_vector(n-1 downto 0)
	);
	
end template;
-- arquitetura da entidade X, pode fazer fora desse arquivo
architecture arq of template is
	subtype InternalState is std_logic_vector(n-1 downto 0); --...
	signal nextState, currentState: InternalState;
	
begin
	--nextState logic comb
	nextState <= entrada when load = '1' else currentState;  -- pod mdar nextState <= ...
	--memory element apenas armazena,define o currentState,  seq
	ME: process(clock, reset) is
			begin
				if reset = '1' then
					currentState <= (others => '0');--reset state --pod mdar currentState <= ...
				elsif rising_edge(clock) then
					currentState <= nextState;
				end if;
			end process;
	--output logic comb
	saida <= currentState; -- saida<= ... currentState ...
end arq;