----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:44
-- Design Name: 
-- Module Name: DP_Mux3_1Bit_21363904 - Behavioral
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

entity DP_Mux3_1Bit_21363904 is
    Port ( Bi : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           slBi : in STD_LOGIC;
           srBi : in STD_LOGIC;
           Gi : out STD_LOGIC);
end DP_Mux3_1Bit_21363904;

architecture Behavioral of DP_Mux3_1Bit_21363904 is

begin

    Gi <= srBi after 5ns when S1 = '1' and S2 = '0' else
          slBi after 5ns when S1 = '0' and S2 = '1' else
          Bi after 5ns;

end Behavioral;
