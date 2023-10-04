----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.12.2022 17:30:01
-- Design Name: 
-- Module Name: CPU_CAR_21363904_TB - Sim
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

entity CPU_CAR_21363904_TB is
--  Port ( ); N/A
end CPU_CAR_21363904_TB;

architecture Sim of CPU_CAR_21363904_TB is

--Component

    component CPU_CAR_21363904
      Port ( Address : in STD_LOGIC_VECTOR (16 downto 0);
             Clock : in STD_LOGIC;
             LoadAdd : in STD_LOGIC;
             Reset : in STD_LOGIC;
             CMAdd : out STD_LOGIC_VECTOR (16 downto 0));
    end component;
    
--Signal

    signal adr_TB : std_logic_vector (16 downto 0) := (others => '0');
    signal clk_TB, load_TB, reset_TB : std_logic := '0';
    
    signal cmadd_TB : std_logic_vector (16 downto 0) := (others => '0');

begin

--Unit Under Test

    uut: CPU_CAR_21363904
    PORT MAP ( Address => adr_TB,
               Clock => clk_TB,
               LoadAdd => load_TB,
               Reset => reset_TB,
               CMAdd => cmadd_TB);
               
    clk_TB <= not clk_TB after 10ns;
               
    stim_proc : process
    begin
    
        wait until clk_TB' event and clk_TB = '1';
        load_TB <= '0' after 5ns;
        adr_TB <= "00000000000000100" after 5ns;
        reset_TB <= '1' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        load_TB <= '1' after 5ns;
    
    end process;

end Sim;
