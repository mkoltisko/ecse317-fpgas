LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY TriStateBufferN IS
	GENERIC (n: INTEGER := 8);
	PORT (
		x:	IN std_logic_vector(n-1 downto 0);
		y:	OUT std_logic_vector(n-1 downto 0);
		oe:	IN std_logic
	);
END TriStateBufferN;

ARCHITECTURE TriStateBufferN_arch OF TriStateBuffer IS
	COMPONENT TriStateBuffer
		PORT (
			x: IN std_logic;
			y: OUT std_logic;
			oe: IN std_logic
		);
	END COMPONENT;
BEGIN
	TB: FOR i IN 0 TO n-1 GENERATE
		TB_i: TriStateBuffer PORT MAP (x(i), y(i), oe);
	END GENERATE;
END TriStateBufferN_arch;

CONFIGURATION TriStateBufferN_cfg OF TriStateBufferN IS
	FOR TriStateBufferN_arch
		FOR Buffer3_arch
		END FOR;
	END FOR;
END CONFIGURATION;	
