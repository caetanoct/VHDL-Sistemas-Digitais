library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Binary_Counter_Nbits is
	generic(n: positive := 8);
	port(
	clk, rst: in std_logic;
	en,inc: in std_logic;
	
	--d: in std_logic_vector(n-1 downto 0);
	q: out std_logic_vector(n-1 downto 0)
	);
end entity;

architecture arq of Binary_Counter_Nbits is
	subtype InternalState is unsigned(n-1 downto 0);
	signal nextState,currentStante: InternalState;
	signal operando: integer;
begin
	operando <= 1 when inc = '1' else -1;
 nextState <= currentStante when en = '0' else
					currentStante + operando;
	ME: process(clk, rst) is
			begin
				if rst = '1' then
					currentStante <= (others => '0');--reset state --pod mdar currentState <= ...
				elsif rising_edge(clk) then
					currentStante <= nextState;
				end if;
			end process;
q <= std_logic_vector(currentStante);
end arq;