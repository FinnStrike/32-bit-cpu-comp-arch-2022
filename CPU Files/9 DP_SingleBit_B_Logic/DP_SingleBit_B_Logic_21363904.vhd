----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:44
-- Design Name: 
-- Module Name: DP_SingleBit_B_Logic_21363904 - Behavioral
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

entity DP_SingleBit_B_Logic_21363904 is
  Port ( B : in STD_LOGIC;
         S0 : in STD_LOGIC;
         S1 : in STD_LOGIC;
         Y : out STD_LOGIC);
end DP_SingleBit_B_Logic_21363904;

architecture Behavioral of DP_SingleBit_B_Logic_21363904 is

begin

    Y <= '0' after 5ns when S0 = '0' and S1 = '0' else
         B after 5ns when S0 = '1' and S1 = '0' else
         Not(B) after 5ns when S0 = '0' and S1 = '1' else
         '1' after 5ns when S0 = '1' and S1 = '1';

end Behavioral;
