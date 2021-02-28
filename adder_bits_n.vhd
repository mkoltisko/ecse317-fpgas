LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY adder_bits_n IS
	GENERIC (n: INTEGER := 2);
	PORT (	c_in:	IN std_logic;
			a, b:	IN std_logic_vector(n-1 downto 0);
			S:		OUT std_logic_vector(n-1 downto 0);
			Cout:	OUT std_logic
	);
END adder_bits_n;

ARCHITECTURE ripple_n_arch OF adder_bits_n IS
	COMPONENT full_adder
		PORT (	x, y, z: 	IN std_logic;
				Sum, Carry: OUT std_logic
		);
	END COMPONENT;
	SIGNAL t: std_logic_vector(n downto 0);
BEGIN
	t(0) <= c_in;
	FA: FOR i IN 0 TO n-1 GENERATE
		FA_i: full_adder PORT MAP (t(i), a(i), b(i), S(i), t(i+1));
	END GENERATE;
	Cout <= t(n);
END adder_bits_n_arch;

CONFIGURATION adder_bits_n_cfg OF adder_bits_n IS
	FOR adder_bits_n_arch
	END FOR;
END CONFIGURATION;

