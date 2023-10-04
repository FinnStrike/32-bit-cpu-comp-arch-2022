----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:44
-- Design Name: 
-- Module Name: DP_CFlagMux2_1Bit_21363904 - Behavioral
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

entity DP_CFlagMux2_1Bit_21363904 is
    Port ( FS4 : in STD_LOGIC;
           C_ALU : in STD_LOGIC;
           C_Shift : in STD_LOGIC;
           C : out STD_LOGIC);
end DP_CFlagMux2_1Bit_21363904;

architecture Behavioral of DP_CFlagMux2_1Bit_21363904 is

begin

    C <= C_ALU after 5ns when FS4 = '0' else
         C_Shift after 5ns when FS4 = '1';

end Behavioral;
