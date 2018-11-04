library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mdcWrapper is
generic(a: natural := 4);
 port(
 clk: in std_logic;
 writedata : in STD_LOGIC_VECTOR(a-1 downto 0);
 adress:	in std_logic_vector(1 downto 0);
 writeFlag: in std_logic;
 x,y,start : out STD_LOGIC_VECTOR(a-1 downto 0)
 );
end mdcWrapper;

architecture bhv of mdcWrapper is
--DECLARAÇAO DE COMPONENTES:
component decodificador2 is
 port(
 a : in STD_LOGIC_VECTOR(1 downto 0);
 b : out STD_LOGIC_VECTOR(3 downto 0)
 );
end component;

component Register_Nbits is
	generic (N: positive := 4);
	port(
	clk, reset,carga: in std_logic;
	d: in std_logic_vector(N-1 downto 0);
	q: out std_logic_vector(N-1 downto 0)
	);
end component;
	
--DECLARAÇAO DE SINAIS
signal decodOutput: std_LOGIC_VECTOR(3 downto 0);
begin
 decod: decodificador2 port map(adress, decodOutput);
 reg1: Register_Nbits generic map(a) port map(clk, '0', decodOutput(0) and writeFlag,writedata,x);
 reg2: Register_Nbits generic map(a) port map(clk, '0', decodOutput(1) and writeFlag,writedata,y);
 start(0) <= '1' when writeFlag = '1' and decodOutput(2) = '1';
end bhv;