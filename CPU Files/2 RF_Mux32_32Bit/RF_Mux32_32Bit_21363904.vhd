----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 10/18/2022 06:32:09 PM
-- Design Name: 
-- Module Name: RF_Mux32_32Bit_21363904 - Behavioral
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

entity RF_Mux32_32Bit_21363904 is
  Port ( M32_s : in  STD_LOGIC_VECTOR (4 downto 0);
         M32_in00 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in01 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in02 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in03 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in04 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in05 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in06 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in07 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in08 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in09 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in10 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in11 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in12 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in13 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in14 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in15 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in16 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in17 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in18 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in19 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in20 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in21 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in22 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in23 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in24 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in25 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in26 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in27 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in28 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in29 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in30 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_in31 : in  STD_LOGIC_VECTOR (31 downto 0);
         M32_z : out  STD_LOGIC_VECTOR (31 downto 0));
end RF_Mux32_32Bit_21363904;

architecture Behavioral of RF_Mux32_32Bit_21363904 is

begin

    M32_z <= M32_in00 after 5ns when M32_s ="00000" else
             M32_in01 after 5ns when M32_s ="00001" else
             M32_in02 after 5ns when M32_s ="00010" else
             M32_in03 after 5ns when M32_s ="00011" else
             M32_in04 after 5ns when M32_s ="00100" else
             M32_in05 after 5ns when M32_s ="00101" else
             M32_in06 after 5ns when M32_s ="00110" else
             M32_in07 after 5ns when M32_s ="00111" else
             M32_in08 after 5ns when M32_s ="01000" else
             M32_in09 after 5ns when M32_s ="01001" else
             M32_in10 after 5ns when M32_s ="01010" else
             M32_in11 after 5ns when M32_s ="01011" else
             M32_in12 after 5ns when M32_s ="01100" else
             M32_in13 after 5ns when M32_s ="01101" else
             M32_in14 after 5ns when M32_s ="01110" else
             M32_in15 after 5ns when M32_s ="01111" else
             M32_in16 after 5ns when M32_s ="10000" else
             M32_in17 after 5ns when M32_s ="10001" else
             M32_in18 after 5ns when M32_s ="10010" else
             M32_in19 after 5ns when M32_s ="10011" else
             M32_in20 after 5ns when M32_s ="10100" else
             M32_in21 after 5ns when M32_s ="10101" else
             M32_in22 after 5ns when M32_s ="10110" else
             M32_in23 after 5ns when M32_s ="10111" else
             M32_in24 after 5ns when M32_s ="11000" else
             M32_in25 after 5ns when M32_s ="11001" else
             M32_in26 after 5ns when M32_s ="11010" else
             M32_in27 after 5ns when M32_s ="11011" else
             M32_in28 after 5ns when M32_s ="11100" else
             M32_in29 after 5ns when M32_s ="11101" else
             M32_in30 after 5ns when M32_s ="11110" else
             M32_in31 after 5ns when M32_s ="11111" else
             "00000000000000000000000000000000" after 5ns;

end Behavioral;
