LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY alu_bits_n IS
	GENERIC (n: INTEGER := 8);
	PORT (
		x, y:	IN std_logic_vector(n-1 downto 0);
		S:	OUT std_logic_vector(n-1 downto 0);
		f:	IN std_logic_vector(2 downto 0)
	);
END alu_bits_n;

ARCHITECTURE ripple_arch OF alu_bits_n IS
	COMPONENT alu_bit
		PORT(
			x, y, c_in:	IN std_logic;
			S, Cout:	OUT std_logic;
			f:		IN std_logic_vector(2 downto 0)
		);
	END COMPONENT;
	SIGNAL t : std_logic_vector(n downto 0);
BEGIN
	t(0) <= '0';
	ALU: FOR i IN 0 TO n-1 GENERATE
		ALU_i: alu_bit PORT MAP (x(i), y(i), t(i), S(i), t(i+1), f);
	END GENERATE;
END ripple_arch;

CONFIGURATION alu_bits_n_cfg OF alu_bits_n IS
	FOR ripple_arch
	END FOR;
END CONFIGURATION;
