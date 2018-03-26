-- COPYRIGHT (C) Z0996690 2018

-- library declaration
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- entity
ENTITY ripple_adder8 IS
	PORT (	A : IN std_logic_vector(7 downto 0);
			B : IN std_logic_vector(7 downto 0);
			Cin : IN std_logic;
			Cout : OUT std_logic;
			S : OUT std_logic_vector(7 downto 0));
END ripple_adder8;

-- architecture
ARCHITECTURE ripple_adder8_architecture OF ripple_adder8 IS
	COMPONENT full_adder IS
	PORT (	A : IN std_logic;
			B : IN std_logic;
			Cin : IN std_logic;
			Cout : OUT std_logic;
			S : OUT std_logic);
	END COMPONENT;
	
	SIGNAL C : std_logic_vector(6 downto 0);
BEGIN
	fa0 : full_adder PORT MAP (	A => A(0),
								B => B(0),
								Cin => Cin,
								Cout => C(0),
								S => S(0));
	fa1 : full_adder PORT MAP (	A => A(1),
								B => B(1),
								Cin => C(0),
								Cout => C(1),
								S => S(1));
	fa2 : full_adder PORT MAP (	A => A(2),
								B => B(2),
								Cin => C(1),
								Cout => C(2),
								S => S(2));
	fa3 : full_adder PORT MAP (	A => A(3),
								B => B(3),
								Cin => C(2),
								Cout => C(3),
								S => S(3));
	fa4 : full_adder PORT MAP (	A => A(4),
								B => B(4),
								Cin => C(3),
								Cout => C(4),
								S => S(4));
	fa5 : full_adder PORT MAP (	A => A(5),
								B => B(5),
								Cin => C(4),
								Cout => C(5),
								S => S(5));
	fa6 : full_adder PORT MAP (	A => A(6),
								B => B(6),
								Cin => C(5),
								Cout => C(6),
								S => S(6));
	fa7 : full_adder PORT MAP (	A => A(7),
								B => B(7),
								Cin => C(6),
								Cout => Cout,
								S => S(7));
END;