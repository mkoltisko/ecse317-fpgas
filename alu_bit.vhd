LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY alu_bit IS
	PORT (
		x, y, c_in:	IN std_logic;
		S, Cout:	OUT std_logic;
		f:			IN std_logic_vector(2 downto 0)
	);
END alu_bit;

ARCHITECTURE alu_bit_arch OF alu_bit IS
	COMPONENT full_adder
		PORT (
			x, y, z: IN std_logic;
			Sum, Carry: OUT std_logic
		);
	END COMPONENT;
	COMPONENT full_subtractor
		PORT (
			x, y, z: IN std_logic;
			Diff, Carry: OUT std_logic
		);
	END COMPONENT;
	SIGNAL Sum, Diff, Carry, Eout: std_logic;
BEGIN
	FA: full_adder PORT MAP (x, y, c_in, Sum, Carry);
	FS: full_subtractor PORT MAP (x, y, c_in, Diff, Eout);
	WITH f SELECT
		S <= 	'0' WHEN "000",
				x 	WHEN "001",
				y	WHEN "010",
				c_in	WHEN "011",
				x OR y	WHEN "100",
				x AND y	WHEN "101",
				Sum		WHEN "110",
				Diff	WHEN "111";
		
	WITH f SELECT
		Cout <= '0' WHEN "000",
				'1' WHEN "010",
				x 	WHEN "011",
				x 	WHEN "100",
				x 	WHEN "101",
				Carry 	WHEN "110",
				Eout	WHEN "111";
END

CONFIGURATION alu_bit_cfg OF alu_bit
	FOR alu_bit_arch;
	END FOR;
END CONFIGURATION;