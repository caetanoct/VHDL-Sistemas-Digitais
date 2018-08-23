library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity demuxNbits is
	generic (WIDTH: natural); 
	port (
entrada: in std_logic_vector (WIDTH-1 downto 0) ;
sel : in std_logic;
s0: out std_logic_vector(WIDTH-1 downto 0)
);
end demuxNbits;

architecture arq of demuxNbits is
begin
s0 <= entrada when sel = '0';
s1 <= entrada when sel = '1';
end arq; 