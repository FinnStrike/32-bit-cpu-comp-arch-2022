----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 10/19/2022 11:54:22 AM
-- Design Name: 
-- Module Name: RF_Mux16_32Bit_21363904 - Behavioral
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

entity RF_Mux16_32Bit_21363904 is
  Port ( M16_s : in  STD_LOGIC_VECTOR (3 downto 0);
         M16_in00 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in01 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in02 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in03 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in04 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in05 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in06 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in07 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in08 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in09 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in10 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in11 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in12 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in13 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in14 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_in15 : in  STD_LOGIC_VECTOR (31 downto 0);
         M16_z : out  STD_LOGIC_VECTOR (31 downto 0));
end RF_Mux16_32Bit_21363904;

architecture Behavioral of RF_Mux16_32Bit_21363904 is

begin

    M16_z <= M16_in00 after 5ns when M16_s ="0000" else
             M16_in01 after 5ns when M16_s ="0001" else
             M16_in02 after 5ns when M16_s ="0010" else
             M16_in03 after 5ns when M16_s ="0011" else
             M16_in04 after 5ns when M16_s ="0100" else
             M16_in05 after 5ns when M16_s ="0101" else
             M16_in06 after 5ns when M16_s ="0110" else
             M16_in07 after 5ns when M16_s ="0111" else
             M16_in08 after 5ns when M16_s ="1000" else
             M16_in09 after 5ns when M16_s ="1001" else
             M16_in10 after 5ns when M16_s ="1010" else
             M16_in11 after 5ns when M16_s ="1011" else
             M16_in12 after 5ns when M16_s ="1100" else
             M16_in13 after 5ns when M16_s ="1101" else
             M16_in14 after 5ns when M16_s ="1110" else
             M16_in15 after 5ns when M16_s ="1111" else
             "00000000000000000000000000000000" after 5ns;

end Behavioral;
