LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY gc_latch IS
	PORT (	
		S, R, LE:	IN std_logic;
		Q, NQ:		OUT std_logic
	);
END gc_latch;

ARCHITECTURE latch_arch OF GC_Latch IS
BEGIN
	PROCESS(R, S, LE) BEGIN
		IF LE = '1' THEN
			IF R = '0' THEN
				Q <= '1';	NQ <= '0';
			ELSIF S = '0' THEN
				Q <= '0';	NQ <= '1';
			END IF;
	END PROCESS;
END ARCHITECTURE;

CONFIGURATION gc_latch_cfg OF gc_latch IS
	FOR latch_arch
	END FOR;
END CONFIGURATION;