----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:44
-- Design Name: 
-- Module Name: DP_ShifterCFlagMux2_1Bit_21363904 - Behavioral
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

entity DP_ShifterCFlagMux2_1Bit_21363904 is
    Port ( S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           LSB : in STD_LOGIC;
           MSB : in STD_LOGIC;
           C : out STD_LOGIC);
end DP_ShifterCFlagMux2_1Bit_21363904;

architecture Behavioral of DP_ShifterCFlagMux2_1Bit_21363904 is

begin

    C <= LSB after 5ns when S1 = '1' and S2 = '0' else
         MSB after 5ns when S2 = '1' and S1 = '0' else
         '0' after 5ns;

end Behavioral;
