----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 08.11.2022 15:20:25
-- Design Name: 
-- Module Name: DP_SingleBit_LogicCircuit_21363904_TB - Sim
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

entity DP_SingleBit_LogicCircuit_21363904_TB is
--  Port ( ); N/A
end DP_SingleBit_LogicCircuit_21363904_TB;

architecture Sim of DP_SingleBit_LogicCircuit_21363904_TB is

--Components

    component DP_SingleBit_LogicCircuit_21363904
    port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC);
    end component;
    
 --Signals
 
    signal a_TB, b_TB, s0_TB, s1_TB : std_logic;
    
    signal g_TB : std_logic;

begin

--Unit Under Test

    uut : DP_SingleBit_LogicCircuit_21363904
    PORT MAP ( A => a_TB,
               B => b_TB,
               S0 => s0_TB,
               S1 => s1_TB,
               G => g_TB);
        
    stim_proc : process
    begin
        
        -- 1 AND 0 = 0
        wait for 20ns;
        a_TB <= '1';
        b_TB <= '0';
        s0_TB <= '0';
        s1_TB <= '0';
        
        -- 1 AND 1 = 1
        wait for 20ns;
        b_TB <= '1';
        
        -- 1 OR 0 = 1
        wait for 20ns;
        a_TB <= '1';
        b_TB <= '0';
        s0_TB <= '1';
        s1_TB <= '0';
        
        -- 1 OR 1 = 1
        wait for 20ns;
        b_TB <= '1';
        
        -- 1 XOR 0 = 1
        wait for 20ns;
        a_TB <= '1';
        b_TB <= '0';
        s0_TB <= '0';
        s1_TB <= '1';
        
        -- 1 XOR 1 = 0
        wait for 20ns;
        b_TB <= '1';
        
        -- NOT 1 = 0
        wait for 20ns;
        a_TB <= '1';
        b_TB <= '0';
        s0_TB <= '1';
        s1_TB <= '1';
        
        -- NOT 0 = 1
        wait for 20ns;
        a_TB <= '0';
    
    end process;

end Sim;
