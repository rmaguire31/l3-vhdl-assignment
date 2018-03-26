-- COPYRIGHT (C) Z0996690 2018

-- library declaration
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- entity
ENTITY mux16_8 IS
	PORT ( 	A : IN std_logic_vector(7 downto 0);
			B : IN std_logic_vector(7 downto 0);
			SEL : IN std_logic;
			Q : OUT std_logic_vector(7 downto 0));
END mux16_8;

-- architecture
ARCHITECTURE mux16_8_architecture OF mux16_8 IS
	-- build out of parallel 2 to 1 muxes
	COMPONENT mux2_1 IS
		PORT ( 	A : IN std_logic;
				B : IN std_logic;
				SEL : IN std_logic;
				Q : OUT std_logic);
	END COMPONENT;
BEGIN
	-- map 8 muxes with common select S
	mux0 : mux2_1 port map (A => A(0),
							B => B(0),
							SEL => SEL,
							Q => Q(0));
	mux1 : mux2_1 port map (A => A(1),
							B => B(1),
							SEL => SEL,
							Q => Q(1));
	mux2 : mux2_1 port map (A => A(2),
							B => B(2),
							SEL => SEL,
							Q => Q(2));
	mux3 : mux2_1 port map (A => A(3),
							B => B(3),
							SEL => SEL,
							Q => Q(3));
	mux4 : mux2_1 port map (A => A(4),
							B => B(4),
							SEL => SEL,
							Q => Q(4));
	mux5 : mux2_1 port map (A => A(5),
							B => B(5),
							SEL => SEL,
							Q => Q(5));
	mux6 : mux2_1 port map (A => A(6),
							B => B(6),
							SEL => SEL,
							Q => Q(6));
	mux7 : mux2_1 port map (A => A(7),
							B => B(7),
							SEL => SEL,
							Q => Q(7));
END mux16_8_architecture;