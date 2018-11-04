LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity mdctop is
generic(a: natural := 4);
port(
writedata	: in std_logic_vector (a-1 downto 0) ;
adress: in std_logic_vector (a-1 downto 0);
readdata: out std_logic_vector(a-1 downto 0);
clk,writeflag, reset: in std_logic
);
end entity;
architecture arq of mdcTop is

component mdc is
generic(m: natural := 4);
port(
x,y: in std_logic_vector (m-1 downto 0) ;
mdcxy: out std_logic_vector(m-1 downto 0);
clk,start, reset: in std_logic
);
end component;

signal saida1adapt, saida2adapt, saida3adapt: std_logic_vector(a-1 downto 0);
begin
Adaptador: wrapper port map(writedata, adress, writeflag,saida1adapt, saida2adapt, saida3adapt);
MDC: mdc generic map(a) port map(saida1adapt,saida2adapt,readdata,clk,saida3adapt(0),reset);
end;

