LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY clock_driver IS
	GENERIC (Speed: TIME := 5 ns);
	PORT (Clk: OUT std_logic); 
END clock_driver;

ARCHITECTURE clock_driver_arch OF clock_driver IS
	SIGNAL Clock:	std_logic := '0';
BEGIN
	Clk <= Clk XOR '1' after Speed;
	Clock <= Clk;
END clock_driver_arch;

CONFIGURATION clock_driver_cfg OF clock_driver IS
	FOR clock_driver_arch
	END FOR;
END CONFIGURATION;