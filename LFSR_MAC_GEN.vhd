/*
Author: Gianni Rago
Last edited: 01/13/2025

48-bit Pseudo-random MAC Address Generator using LFSR (Linear Feedback Shift Register)
*/

Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY LFSR_MAC_GEN IS
	PORT(   CLK   : IN STD_LOGIC;
			RST   : IN STD_LOGIC;
			
			MAC_ADDRESS : OUT STD_LOGIC_VECTOR(47 DOWNTO 0));
END LFSR_MAC_GEN;

ARCHITECTURE BEHAVIORAL OF LFSR_MAC_GEN IS
	--Inital value/MAC address, this will be used to determine future output MAC addresses
    CONSTANT SEED : STD_LOGIC_VECTOR(47 downto 0) := x"123456ABCDEF";
    --Linear Feedback Shift Register, 48 bits
	SIGNAL LFSR : STD_LOGIC_VECTOR(47 DOWNTO 0) := (OTHERS => '1');

BEGIN
	--Process uses LFSR to calculate new MAC address every clock cycle
	PROCESS(CLK,RST)
	BEGIN
		--Initial state
		IF (RST = '1') THEN
			LFSR <= SEED;
		--LFSR calculation, calculates the new bit to be shifted into the most significant position
		--Based on the previous LFSR value
		ELSIF RISING_EDGE(CLK) THEN
			LFSR <= LFSR(46 DOWNTO 0) & (LFSR(47) XOR LFSR(5) XOR LFSR (4) XOR LFSR (3));
		END IF;
	END PROCESS;
	
	MAC_ADDRESS <= LFSR;
	
END BEHAVIORAL;




