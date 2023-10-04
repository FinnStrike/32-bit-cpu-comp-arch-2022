----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 17.12.2022 16:44:04
-- Design Name: 
-- Module Name: CPU_PC_21363904_TB - Sim
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

entity CPU_PC_21363904_TB is
--  Port ( ); N/A
end CPU_PC_21363904_TB;

architecture Sim of CPU_PC_21363904_TB is

--Components

    component CPU_PC_21363904
      Port ( Clock : in STD_LOGIC;
             Displacement : in STD_LOGIC_VECTOR (31 downto 0);
             PI : in STD_LOGIC;
             PL : in STD_LOGIC;
             Reset : in STD_LOGIC;
             InstAdd : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal clk_TB, pi_TB, pl_TB, reset_TB : std_logic := '0';
    signal disp_TB : std_logic_vector (31 downto 0) := (others => '0');
    
    signal instadd_TB : std_logic_vector (31 downto 0) := (others => '0');

begin

--Unit Under Test

    uut : CPU_PC_21363904
    PORT MAP ( Clock => clk_TB,
               Displacement => disp_TB,
               PI => pi_TB,
               PL => pl_TB,
               Reset => reset_TB,
               InstAdd => instadd_TB);
               
    clk_TB <= not clk_TB after 180 ns;
    
    stim_proc : process
    begin
        
        --Reset to 0x00000004
        wait until clk_TB' event and clk_TB = '1';
        disp_TB <= X"00000000";
        pi_TB <= '0';
        pl_TB <= '0';
        reset_TB <= '1' after 5ns;
        
        --Increment PC
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0' after 5ns;
        pi_TB <= '1' after 5ns;
        
        --Displace PC by X"00000004"
        wait until clk_TB' event  and clk_TB = '1';
        pi_TB <= '0' after 5ns;
        pl_TB <= '1' after 5ns;
        disp_TB <= X"00000004" after 5ns;
        
    end process;

end Sim;
