/*
Author: Gianni Rago
Last edited: 01/07/2025

Testbench for LFSR_MAC_GEN
*/

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_LFSR_MAC is
end tb_LFSR_MAC;

architecture Behavioral of tb_LFSR_MAC is
    signal CLK : STD_LOGIC := '0';
    signal RST : STD_LOGIC := '0';
    signal MAC_ADDRESS : STD_LOGIC_VECTOR (47 downto 0);

    component LFSR_MAC_GEN
        Port ( CLK : in STD_LOGIC;
               RST : in STD_LOGIC;
               MAC_ADDRESS : out STD_LOGIC_VECTOR (47 downto 0));
    end component;

begin
    uut: LFSR_MAC_GEN
        Port map (
            CLK => CLK,
            RST => RST,
            MAC_ADDRESS => MAC_ADDRESS
        );

    -- 20 ns full clock cycle
    clk_process :process
    begin
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
    end process;

    -- Hold reset for 20 ns
    stim_proc: process
    begin
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait;
    end process;
end Behavioral;