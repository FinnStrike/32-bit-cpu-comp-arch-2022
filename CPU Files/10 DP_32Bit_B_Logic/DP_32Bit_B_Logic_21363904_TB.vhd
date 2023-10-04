----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 08.11.2022 14:45:15
-- Design Name: 
-- Module Name: DP_32Bit_B_Logic_21363904_TB - Sim
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

entity DP_32Bit_B_Logic_21363904_TB is
--  Port ( ); N/A
end DP_32Bit_B_Logic_21363904_TB;

architecture Sim of DP_32Bit_B_Logic_21363904_TB is

--Components

    component DP_32Bit_B_Logic_21363904
    port ( B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal b_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal s0_TB, s1_TB : std_logic;
    
    signal y_TB : std_logic_vector (31 downto 0) := (others => '0');

begin

--Unit Under Test

    uut : DP_32Bit_B_Logic_21363904
    PORT MAP ( B => b_TB,
               S0 => s0_TB,
               S1 => s1_TB,
               Y => y_TB);
    
    stim_proc : process
    begin
    
        wait for 20ns;
        b_TB <= "00000001010001011111110011000000";
        s0_TB <= '0';
        s1_TB <= '0';
        
        wait for 20ns;
        s0_TB <= '1';
        s1_TB <= '0';
        
        wait for 20ns;
        s0_TB <= '0';
        s1_TB <= '1';
        
        wait for 20ns;
        s0_TB <= '1';
        s1_TB <= '1';
    
    end process;

end Sim;
