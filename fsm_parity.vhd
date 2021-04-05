LIBRARY IEEE;
USE IEE.std_logic_1164.all;

ENTITY fsm_parity IS
	PORT (	i1:		IN std_logic;
			o1:		OUT std_logic;
			CLK:	IN std_logic;
			RST:	IN std_logic 
		);
END fsm_parity;

ARCHITECTURE fsm_parity_arch OF fsm_parity IS
	TYPE fsm_states IS (s1, s2);
	SIGNAL	State, NextState: fsm_states;
BEGIN
	PROCESS (State, i1) BEGIN
		CASE State IS
			WHEN s1 => 	
				IF i1 = '1' THEN NextState <= s2;
							ELSE NextState <= s1;
				END IF;
				o1 <= '0';
			WHEN s2 => 	
				IF i1 = '1' THEN NextState <= s1;
							ELSE NextState <= s2;
				END IF;
				o1 <= '1';
			WHEN OTHERS => 
				o1 <= '1';
				NextState <= NextState;
		END CASE;
	END PROCESS;
	
	PROCESS (CLK, RST) BEGIN
		IF RST = '1' THEN
			State <= s1;
		ELSIF rising_edge(CLK) THEN
			State <= NextState;
		END IF;
	END PROCESS;
END fsm_parity_arch;

CONFIGURATION fsm_parity_cfg OF fsm_parity IS
	FOR fsm_parity_arch
	END FOR;
END CONFIGURATION;