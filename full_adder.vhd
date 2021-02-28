LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY full_adder IS
	PORT (
		x, y, z:	IN std_logic;
		Sum, Carry:	OUT std_logic
	);
END full_adder;

ARCHITECTURE full_adder_arch OF full_adder IS
BEGIN
	Sum <= ((x XOR y) XOR z);
	Carry <= ((x AND y) OR (z AND (x AND y)));
END full_adder_arch;

CONFIGURATION full_adder_cfg of full_adder IS
	FOR full_adder_arch
	END FOR;
END CONFIGURATION;