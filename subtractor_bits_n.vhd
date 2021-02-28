LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY subtractor_bit_n IS
	GENERIC (n: INTEGER := 2);
	PORT (
		e_in: 	IN std_logic;
		a, b: 	IN std_logic_vector(n-1 downto 0);
		D:		OUT std_logic_vector(n-1 downto 0);	
		Eout: 	OUT std_logic;
	);
END subtractor_bit_n;

ARCHITECTURE ripple_n_arch OF subtractor_bit_n IS
	COMPONENT full_subtractor
		PORT (
			e_in, a, b: IN std_logic;
			Diff, Eout: OUT std_logic
		);
	END COMPONENT;
	SIGNAL t: std_logic_vector(n downto 0);
BEGIN
	t(0) = e_in;
	FS: FOR i IN 0 TO n-1 GENERATE
		FS_i: full_subtractor PORT MAP(t(i), a(i), b(i), Diff(i), t(i+1));
	END GENERATE;
	Eout <= t(n);
END ripple_n_arch;

CONFIGURATION 
	FOR ripple_n_arch
	END FOR;
END CONFIGURATION;