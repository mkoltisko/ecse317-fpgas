LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY TriStateBuffer IS
	PORT (
		x:	IN std_logic;
		y:	OUT std_logic;
		oe:	IN std_logic
	);
END TriStateBuffer;

ARCHITECTURE Buffer3_arch OF TriStateBuffer IS
BEGIN
	WITH oe SELECT
	y <= x WHEN '1',
			'Z' WHEN OTHERS;
END Buffer3_arch;

CONFIGURATION TriStateBuffer_cfg OF TriStateBuffer IS
	FOR Buffer3
	END FOR;
END CONFIGURATION;