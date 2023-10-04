----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:43
-- Design Name: 
-- Module Name: DP_ZeroDetection_21363904 - Behavioral
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

entity DP_ZeroDetection_21363904 is
    Port ( F : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC);
end DP_ZeroDetection_21363904;

architecture Behavioral of DP_ZeroDetection_21363904 is

begin

    Z <= Not(F(0) or F(1) or F(2) or F(3) or F(4) or F(5) or F(6) or F(7)
         or F(8) or F(9) or F(10) or F(11) or F(12) or F(13) or F(14) or F(15)
         or F(16) or F(17) or F(18) or F(19) or F(20) or F(21) or F(22) or F(23)
         or F(24) or F(25) or F(26) or F(27) or F(28) or F(29) or F(30) or F(31)) after 5ns;

end Behavioral;
