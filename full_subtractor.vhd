LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY full_subtractor IS
	PORT (
		x, y, z:
		Diff, Carry:
	);
END full_subtractor;

ARCHITECTURE full_subtractor_arch OF full_subtractor IS
BEGIN
	Diff <= ((x XOR y) XOR z);
	Carry <= ((NOT y) AND (x OR z)) OR (x AND z);
END full_subtractor;

CONFIGURATION full_subtractor_cfg OF full_subtractor IS
	FOR full_subtractor_arch
	END FOR;
END CONFIGURATION;
