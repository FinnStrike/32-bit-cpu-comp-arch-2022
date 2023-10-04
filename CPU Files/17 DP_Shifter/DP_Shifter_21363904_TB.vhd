----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 08.11.2022 21:16:54
-- Design Name: 
-- Module Name: DP_Shifter_21363904_TB - Sim
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

entity DP_Shifter_21363904_TB is
--  Port ( ); N/A
end DP_Shifter_21363904_TB;

architecture Sim of DP_Shifter_21363904_TB is

--Components

    component DP_Shifter_21363904
    port ( B : in STD_LOGIC_VECTOR (31 downto 0);
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (31 downto 0);
           C : out STD_LOGIC);
    end component;
    
--Signals

    signal b_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal s1_TB, s2_TB : std_logic;
    
    signal g_TB : std_logic_vector (31 downto 0) := (others => '0');    
    signal c_TB : std_logic;

begin

--Unit Under Test

    uut : DP_Shifter_21363904
    PORT MAP ( B => b_TB,
               S1 => s1_TB,
               S2 => s2_TB,
               G => g_TB,
               C => c_TB);
    
    stim_proc : process
    begin
    
        --Leave unchanged
        wait for 20ns;
        b_TB <= "00000001010001011111110011000000";
        s1_TB <= '0';
        s2_TB <= '0';
        
        --Shift Right
        wait for 20ns;
        b_TB <= "00000001010001011111110011000000";
        s1_TB <= '1';
        s2_TB <= '0';
        
        --Shift Left
        wait for 20ns;
        b_TB <= "00000001010001011111110011000000";
        s1_TB <= '0';
        s2_TB <= '1';
        
        --Set Carry Shift Right
        wait for 20ns;
        b_TB <= "00000000000000000000000000000001";
        s1_TB <= '1';
        s2_TB <= '0';
        
        --Unset Carry
        wait for 20ns;
        b_TB <= "00000000000000000000000000000000";
        s1_TB <= '0';
        s2_TB <= '0';
        
        --Set Carry Shift Left
        wait for 20ns;
        b_TB <= "10000000000000000000000000000000";
        s1_TB <= '0';
        s2_TB <= '1';
        
        --Unset Carry
        wait for 20ns;
        b_TB <= "00000000000000000000000000000000";
        s1_TB <= '0';
        s2_TB <= '0';
    
    end process;

end Sim;
