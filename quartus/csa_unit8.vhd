-- COPYRIGHT (C) Z0996690 2018

-- library declaration
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- entity
ENTITY csa_unit8 IS
	PORT (	A : IN std_logic_vector(7 downto 0);
			B : IN std_logic_vector(7 downto 0);
			Cin : IN std_logic;
			Cout : OUT std_logic;
			S : OUT std_logic_vector(7 downto 0));
END csa_unit8;

-- architecture
ARCHITECTURE csa_unit8_architecture OF csa_unit8 IS
	-- compute two 8-bit candidates using ripple adders
	COMPONENT ripple_adder8 IS
	PORT (	A : IN std_logic_vector(7 downto 0);
			B : IN std_logic_vector(7 downto 0);
			Cin : IN std_logic;
			Cout : OUT std_logic;
			S : OUT std_logic_vector(7 downto 0));
	END COMPONENT;
	
	-- select an 8-bit sum using mux
	COMPONENT mux16_8 IS
	PORT ( 	A : IN std_logic_vector(7 downto 0);
			B : IN std_logic_vector(7 downto 0);
			SEL : IN std_logic;
			Q : OUT std_logic_vector(7 downto 0));
	END COMPONENT;
	
	-- select carry out using mux
	COMPONENT mux2_1 IS
	PORT ( 	A : IN std_logic;
			B : IN std_logic;
			SEL : IN std_logic;
			Q : OUT std_logic);
	END COMPONENT;
	
	-- candidates calculated by each ripple adder
	SIGNAL S0 : std_logic_vector(7 downto 0);
	SIGNAL Cout0 : std_logic;
	SIGNAL S1 : std_logic_vector(7 downto 0);
	SIGNAL Cout1 : std_logic;
BEGIN
	ra0 : ripple_adder8 PORT MAP (	A => A,
									B => B,
									Cin => '0',
									Cout => Cout0,
									S => S0);
	ra1 : ripple_adder8 PORT MAP (	A => A,
									B => B,
									Cin => '1',
									Cout => Cout1,
									S => S1);
	smux : mux16_8 PORT MAP (A => S0,
							 B => S1,
							 SEL => Cin,
							 Q => S);
	cmux : mux2_1 PORT MAP ( A => Cout0,
							 B => Cout1,
							 SEL => Cin,
							 Q => Cout);
END;