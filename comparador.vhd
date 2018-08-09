LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
ENTITY compare IS
	PORT (A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
	AigualB, AmaiorqB, AmenorqB : OUT STD_LOGIC ) ;
END compare ;
ARCHITECTURE Behavior OF compare IS
BEGIN
	AigualB <= '1' WHEN A = B ELSE '0' ;
	AmaiorqB <= '1' WHEN A > B ELSE '0' ;
	AmenorqB <= '1' WHEN A < B ELSE '0' ;
END Behavior ;