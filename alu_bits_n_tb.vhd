LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY alu_bits_n_tb IS
	GENERIC (n: INTEGER := 8);
	PORT (S: OUT std_logic_vector(n-1 downto 0));
END alu_bits_n_tb;

ARCHITECTURE alu_bits_n_tb_arch OF alu_bits_n_tb IS
	COMPONENT alu_bits_n
		GENERIC (n: INTEGER := 8);
		PORT (
			x, y:	IN std_logic_vector(n-1 downto 0);
			S:	OUT std_logic_vector(n-1 downto 0);
			f:	IN std_logic_vector(2 downto 0)
		);
	END COMPONENT;
	SIGNAL X, Y: std_logic_vector(n-1 downto 0);
	SIGNAL f: std_logic_vector(2 downto 0);
BEGIN
	f <= "000",
			"001" after 100 ns,
			"010" after 200 ns,
			"011" after 300 ns,
			"100" after 400 ns,
			"101" after 500 ns,
			"110" after 600 ns,
			"111" after 700 ns;
	Y <= X"00",
			X"01" after 50 ns,
			X"02" after 150 ns,
			X"03" after 250 ns,
			X"04" after 350 ns,
			X"05" after 450 ns,
			X"06" after 550 ns,
			X"07" after 650 ns,
			X"08" after 750 ns;
	
	X <= X"00",
			X"09" after 100 ns,
			X"0a" after 200 ns,
			X"0b" after 300 ns,
			X"0c" after 400 ns,
			X"0d" after 500 ns,
			X"0e" after 600 ns,
			X"0f" after 700 ns;
			
	ALU: alu_bits_n GENERIC MAP(n) PORT MAP (X, Y, S, f);
END alu_bits_n_tb_arch;

CONFIGURATION alu_bits_n_tb_cfg OF alu_bits_n_tb IS
	FOR alu_bits_n_tb_arch
	END FOR;
END CONFIGURATION;
