library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adderN is
	generic(n: positive := 8);
	port(
	a,b: in std_logic_vector(n-1 downto 0);
	saida: out std_logic_vector(n-1 downto 0);
	ovflow: out std_logic
	);
end adderN;

architecture arq of adderN is
	signal soma: std_logic_vector(n downto 0);
	begin
		soma <= std_logic_vector(signed(a(n-1)&a) + signed(b(n-1)&b)); --numero com sinal concatenar com o ultimo mais significativo com o ele mesmo, nao muda o valor ex: 010(2) = 0010(2); 111(-3) = 1111(-3);
		saida <= soma(n-1 downto 0);
		ovflow <= soma(n);
	end arq;