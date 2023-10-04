----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 03.12.2022 20:02:56
-- Design Name: 
-- Module Name: CPU_DFlipFlop_21363904_TB - Sim
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

entity CPU_DFlipFlop_21363904_TB is
--  Port ( ); N/A
end CPU_DFlipFlop_21363904_TB;

architecture Sim of CPU_DFlipFlop_21363904_TB is

--Components

    component CPU_DFlipFlop_21363904
    Port ( Clock : in STD_LOGIC;
           D : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC);
    end component;

--Signals

    signal clk_TB, d_TB, enable_TB, reset_TB : std_logic := '0';
    
    signal q_TB : std_logic := '0';

begin

--Unit Under Test

    uut : CPU_DFlipFlop_21363904
    PORT MAP ( Clock => clk_TB,
               D => d_TB,
               Enable => enable_TB,
               Reset => reset_TB,
               Q => q_TB);
               
    clk_TB <= not clk_TB  after 10ns;

    stim_proc : process
    begin
    
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        d_TB <= '1'after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        enable_TB <= '1'after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        enable_TB <= '0'after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '1'after 5ns;
              
    end process;

end Sim;
