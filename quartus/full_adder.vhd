-- COPYRIGHT (C) Z0996690 2018

-- library declaration
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- entity
ENTITY full_adder IS
	PORT (	A : IN std_logic;
			B : IN std_logic;
			Cin : IN std_logic;
			Cout : OUT std_logic;
			S : OUT std_logic);
END full_adder;

-- architecture
ARCHITECTURE full_adder_architecture OF full_adder IS
BEGIN
	Cout <= ((A xor B) and Cin) or (A and B);
	S <= (A xor B) xor Cin;
END;