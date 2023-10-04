----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 06.11.2022 20:09:56
-- Design Name: 
-- Module Name: DP_ShifterCFlagMux2_1Bit_21363904_TB - Sim
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DP_ShifterCFlagMux2_1Bit_21363904_TB is
--  Port ( ); N/A
end DP_ShifterCFlagMux2_1Bit_21363904_TB;

architecture Sim of DP_ShifterCFlagMux2_1Bit_21363904_TB is

--Components

    component DP_ShifterCFlagMux2_1Bit_21363904
    port ( S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           LSB : in STD_LOGIC;
           MSB : in STD_LOGIC;
           C : out STD_LOGIC);
    end component;

--Signals

    signal s1_TB, s2_TB, lsb_TB, msb_TB : std_logic;
    
    signal c_TB : std_logic;

begin

--Unit Under Test

    uut: DP_ShifterCFlagMux2_1Bit_21363904
    PORT MAP ( S1 => s1_TB,
               S2 => s2_TB,
               LSB => lsb_TB,
               MSB => msb_TB,
               C => c_TB);
               
    stim_proc : process
    begin
    
        wait for 20ns;
        s1_TB <= '0';
        s2_TB <= '0';
        lsb_TB <= '1';
        msb_TB <= '1';
        
        wait for 20ns;
        s1_TB <= '1';
        
        wait for 20ns;
        s1_TB <= '0';
        
        wait for 20ns;
        s2_TB <= '1';
        
        wait for 20ns;
        s2_TB <= '0';
    
    end process;


end Sim;
