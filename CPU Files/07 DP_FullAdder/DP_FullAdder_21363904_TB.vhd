----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 07.11.2022 11:38:26
-- Design Name: 
-- Module Name: DP_FullAdder_21363904_TB - Sim
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

entity DP_FullAdder_21363904_TB is
--  Port ( ); N/A
end DP_FullAdder_21363904_TB;

architecture Sim of DP_FullAdder_21363904_TB is

--Components

    component DP_FullAdder_21363904  
    port( A : in STD_LOGIC;
          B : in STD_LOGIC;
          C_IN : in STD_LOGIC;
          SUM : out STD_LOGIC;
          C_OUT : out STD_LOGIC);
    end component;
    
--Signals

    signal a_TB, b_TB, c_in_TB : std_logic;
    
    signal sum_TB, c_out_TB : std_logic;

begin

--Unit Under Test

    uut: DP_FullAdder_21363904
    PORT MAP ( A => a_TB,
               B => b_TB,
               C_IN => c_in_TB,
               SUM => sum_TB,
               C_OUT => c_out_TB);
    
    stim_proc : process
    begin
    
        wait for 20 ns; 
        a_TB <= '0'; 
        b_TB <= '0'; 
        c_in_TB <= '0';        
            
        wait for 20 ns; 
        a_TB <= '0'; 
        b_TB <= '0'; 
        c_in_TB <= '1';
        
        wait for 20 ns; 
        a_TB <= '0'; 
        b_TB <= '1'; 
        c_in_TB <= '0'; 
        
        wait for 20 ns; 
        a_TB <= '0'; 
        b_TB <= '1'; 
        c_in_TB <= '1';

        wait for 20 ns; 
        a_TB <= '1'; 
        b_TB <= '0'; 
        c_in_TB <= '0';
        
        wait for 20 ns; 
        a_TB <= '1'; 
        b_TB <= '0'; 
        c_in_TB <= '1';
        
        wait for 20 ns;
        a_TB <= '1'; 
        b_TB <= '1'; 
        c_in_TB <= '0';
        
        wait for 20 ns; 
        a_TB <= '1'; 
        b_TB <= '1'; 
        c_in_TB <= '1';    
    
    end process;

end Sim;
