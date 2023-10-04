----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 07.11.2022 11:05:58
-- Design Name: 
-- Module Name: DP_ZeroDetection_21363904_TB - Sim
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

entity DP_ZeroDetection_21363904_TB is
--  Port ( ); N/A
end DP_ZeroDetection_21363904_TB;

architecture Sim of DP_ZeroDetection_21363904_TB is

--Components

    component DP_ZeroDetection_21363904
    port ( F : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC);
    end component;

--Signals

    signal f_TB : std_logic_vector (31 downto 0) := (others => '0');
    
    signal z_TB : std_logic;

begin

--Unit Under Test

    uut: DP_ZeroDetection_21363904
    PORT MAP ( F => f_TB,
               Z => z_TB);

    stim_proc : process
    begin
    
        wait for 20ns;
        f_TB <= "00000000000000000000000000000000";
        
        wait for 20ns;
        f_TB <= "11111111111111111111111111111111";
        
        wait for 20ns;
        f_TB <= "01010101010101010101010101010101";
        
        wait for 20ns;
        f_TB <= "00000000000000000100000000000000";

    end process;
    
end Sim;
