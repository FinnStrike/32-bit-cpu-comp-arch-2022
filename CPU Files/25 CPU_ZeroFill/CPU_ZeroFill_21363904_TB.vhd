----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 07.12.2022 19:57:46
-- Design Name: 
-- Module Name: CPU_ZeroFill_21363904_TB - Sim
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

entity CPU_ZeroFill_21363904_TB is
--  Port ( ); N/A
end CPU_ZeroFill_21363904_TB;

architecture Sim of CPU_ZeroFill_21363904_TB is

--Components

    component CPU_ZeroFill_21363904
      Port ( SB : in STD_LOGIC_VECTOR (4 downto 0);
             MuxB : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

--Signals

    signal sb_TB : std_logic_vector (4 downto 0) := (others => '0');
    
    signal muxb_TB : std_logic_vector (31 downto 0) := (others => '0');

begin

--Unit Under Test

    uut : CPU_ZeroFill_21363904
    PORT MAP ( SB => sb_TB,
               MuxB => muxb_TB);
    
    stim_proc : process
    begin
    
        wait for 20ns;
        sb_TB <= "11111";
        
    end process;

end Sim;
