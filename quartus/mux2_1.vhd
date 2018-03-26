-- COPYRIGHT (C) Z0996690 2018

-- library declaration
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- entity
ENTITY mux2_1 IS
	PORT ( 	A : IN std_logic;
			B : IN std_logic;
			SEL : IN std_logic;
			Q : OUT std_logic);
END mux2_1;

-- architecture
ARCHITECTURE mux2_1_architecture OF mux2_1 IS
BEGIN
	Q <= (A and not SEL) or (B and SEL);
END mux2_1_architecture;