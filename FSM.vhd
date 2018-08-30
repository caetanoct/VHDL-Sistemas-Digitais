library ieee;
use ieee.std_logic_1164.all;

entity FSM is 
	

	port(
			--control input
			clock,reset: in std_logic;
			SA, SF , OB , CR: in std_logic;
			--data input
			--control output
			MT: out std_logic_vector(1 downto 0)
			--data outpu
	);
	
end FSM;
-- arquitetura da entidade X, pode fazer fora desse arquivo
architecture arq of FSM is
	type InternalState is (fechando, fechado, aberto, abrindo); 	
	signal nextState, currentState: InternalState;
	
begin
	--nextState logic comb
	--nextState <= fechado when (currentState = fechado and CR = '0') or (currentState = fechando and SF = '1' and OB = '0');
	--process para setar o next state
	
	NSL: process(currentState, SA, SF, OB, CR) is
	begin
		nextState <= currentState;
		case currentState is
			when fechando =>
				--se esta setando um sinal, o sinal deve ser setado em todos estado, senao vira sequencial
				--setando nextState, setar em todos
				--sempre setar o prox estado
				if ob = '1' then
					nextState <= abrindo;
				elsif sf = '1' then
					nextState <= fechado;
				end if;
			when fechado => 
				nextState <= fechado;
			when abrindo =>
				if sa = '1' then
					nextState <= aberto;
				--else colocou nextState <= currentState em cima do case
 					--nextState <= abrindo;
				--end if;
				end if;
			when aberto => 
				if cr = '1' then
				nextState <= fechando;
				end if;
		end case;
	end process;
	--memory element apenas armazena,define o currentState,  seq
	ME: process(clock, reset) is
			begin
				if reset = '1' then
					currentState <= fechando;--reset state --pod mdar currentState <= ...
				elsif rising_edge(clock) then
					currentState <= nextState;
				end if;
			end process;
	--output logic comb
	MT <= "10" when currentState = fechando else
			"01" when currentState =  abrindo else
			"00"; -- saida<= ... currentState ...
	--OL: process currentState is
	--
		--begin
		--	A <= '0';
			--B<= '0';
		--	C <= '0';
			--D <= '0';
		--	case currentState is
		--		when fechando =>
		--			A <= '1';
				
		--	end case;
		--end process
		
--qnd usar process setar 1 coisa, deve setar em todos casos
end arq;