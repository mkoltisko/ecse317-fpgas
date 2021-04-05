LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY dff_reset IS
	PORT (
		D:						IN std_logic;
		Reset, Preset, Clock:	IN std_logic;
		Q:						OUT std_logic
	);
END dff_reset;

ARCHITECTURE dff_reset_arch OF dff_reset IS
BEGIN
	PROCESS (Clock, Reset, Preset) BEGIN
		IF Reset = '1' THEN
			Q <= '0';
		ELSIF Preset = '1' THEN	
			Q = '0';
		ELSIF rising_edge(Clock) THEN
			Q <= D;
		END IF;
	END PROCESS;
END dff_reset_arch;

CONFIGURATION dff_reset_cfg OF dff_reset IS
	FOR dff_reset_arch
	END FOR;
END CONFIGURATION;