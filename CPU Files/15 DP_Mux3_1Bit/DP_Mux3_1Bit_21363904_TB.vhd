----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 06.11.2022 15:36:52
-- Design Name: 
-- Module Name: DP_Mux3_1Bit_21363904_TB - Sim
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

entity DP_Mux3_1Bit_21363904_TB is
--  Port ( ); N/A
end DP_Mux3_1Bit_21363904_TB;

architecture Sim of DP_Mux3_1Bit_21363904_TB is

--Components

    component DP_Mux3_1Bit_21363904
    port ( Bi : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           slBi : in STD_LOGIC;
           srBi : in STD_LOGIC;
           Gi : out STD_LOGIC);
    end component;
    
--Signals    
    
    signal bi_TB, slbi_TB, srbi_TB, s1_TB, s2_TB : std_logic;
    
    signal gi_TB : std_logic;

begin

--Unit Under Test

    uut: DP_Mux3_1Bit_21363904
    PORT MAP ( Bi => bi_TB,
               S1 => s1_TB,
               S2 => s2_TB,
               slBi => slbi_TB,
               srBi => srbi_TB,
               Gi => gi_TB);
               
    stim_proc : process
    begin
    
        wait for 20ns;
        bi_TB <= '1';
        srbi_TB <= '0';
        slbi_TB <= '1';
        s1_TB <= '0';
        s2_TB <= '0';
        
        wait for 20ns;
        s1_TB <= '1';
        
        wait for 20ns;
        s1_TB <= '0';
        s2_TB <= '1';
    
    end process;

end Sim;
