----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 10/19/2022 11:29:25 AM
-- Design Name: 
-- Module Name: RF_DestReg_Decoder_21363904 - Behavioral
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

entity RF_DestReg_Decoder_21363904 is
  Port ( DR_D_D : in STD_LOGIC_VECTOR (4 downto 0);
         DR_D_R00 : out std_logic;
         DR_D_R01 : out std_logic;
         DR_D_R02 : out std_logic;
         DR_D_R03 : out std_logic;
         DR_D_R04 : out std_logic;
         DR_D_R05 : out std_logic;
         DR_D_R06 : out std_logic;
         DR_D_R07 : out std_logic;
         DR_D_R08 : out std_logic;
         DR_D_R09 : out std_logic;
         DR_D_R10 : out std_logic;
         DR_D_R11 : out std_logic;
         DR_D_R12 : out std_logic;
         DR_D_R13 : out std_logic;
         DR_D_R14 : out std_logic;
         DR_D_R15 : out std_logic;
         DR_D_R16 : out std_logic;
         DR_D_R17 : out std_logic;
         DR_D_R18 : out std_logic;
         DR_D_R19 : out std_logic;
         DR_D_R20 : out std_logic;
         DR_D_R21 : out std_logic;
         DR_D_R22 : out std_logic;
         DR_D_R23 : out std_logic;
         DR_D_R24 : out std_logic;
         DR_D_R25 : out std_logic;
         DR_D_R26 : out std_logic;
         DR_D_R27 : out std_logic;
         DR_D_R28 : out std_logic;
         DR_D_R29 : out std_logic;
         DR_D_R30 : out std_logic;
         DR_D_R31 : out std_logic);
end RF_DestReg_Decoder_21363904;

architecture Behavioral of RF_DestReg_Decoder_21363904 is

begin

    DR_D_R00 <= (NOT(DR_D_D(4)) AND NOT(DR_D_D(3)) AND NOT(DR_D_D(2)) AND NOT(DR_D_D(1)) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R01 <= (NOT(DR_D_D(4)) AND NOT(DR_D_D(3)) AND NOT(DR_D_D(2)) AND NOT(DR_D_D(1)) AND DR_D_D(0)) after 5ns;
    DR_D_R02 <= (NOT(DR_D_D(4)) AND NOT(DR_D_D(3)) AND NOT(DR_D_D(2)) AND DR_D_D(1) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R03 <= (NOT(DR_D_D(4)) AND NOT(DR_D_D(3)) AND NOT(DR_D_D(2)) AND DR_D_D(1) AND DR_D_D(0)) after 5ns;
    DR_D_R04 <= (NOT(DR_D_D(4)) AND NOT(DR_D_D(3)) AND DR_D_D(2) AND NOT(DR_D_D(1)) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R05 <= (NOT(DR_D_D(4)) AND NOT(DR_D_D(3)) AND DR_D_D(2) AND NOT(DR_D_D(1)) AND DR_D_D(0)) after 5ns;
    DR_D_R06 <= (NOT(DR_D_D(4)) AND NOT(DR_D_D(3)) AND DR_D_D(2) AND DR_D_D(1) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R07 <= (NOT(DR_D_D(4)) AND NOT(DR_D_D(3)) AND DR_D_D(2) AND DR_D_D(1) AND DR_D_D(0)) after 5ns;
    DR_D_R08 <= (NOT(DR_D_D(4)) AND DR_D_D(3) AND NOT(DR_D_D(2)) AND NOT(DR_D_D(1)) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R09 <= (NOT(DR_D_D(4)) AND DR_D_D(3) AND NOT(DR_D_D(2)) AND NOT(DR_D_D(1)) AND DR_D_D(0)) after 5ns;
    DR_D_R10 <= (NOT(DR_D_D(4)) AND DR_D_D(3) AND NOT(DR_D_D(2)) AND DR_D_D(1) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R11 <= (NOT(DR_D_D(4)) AND DR_D_D(3) AND NOT(DR_D_D(2)) AND DR_D_D(1) AND DR_D_D(0)) after 5ns;
    DR_D_R12 <= (NOT(DR_D_D(4)) AND DR_D_D(3) AND DR_D_D(2) AND NOT(DR_D_D(1)) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R13 <= (NOT(DR_D_D(4)) AND DR_D_D(3) AND DR_D_D(2) AND NOT(DR_D_D(1)) AND DR_D_D(0)) after 5ns;
    DR_D_R14 <= (NOT(DR_D_D(4)) AND DR_D_D(3) AND DR_D_D(2) AND DR_D_D(1) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R15 <= (NOT(DR_D_D(4)) AND DR_D_D(3) AND DR_D_D(2) AND DR_D_D(1) AND DR_D_D(0)) after 5ns;
    DR_D_R16 <= (DR_D_D(4) AND NOT(DR_D_D(3)) AND NOT(DR_D_D(2)) AND NOT(DR_D_D(1)) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R17 <= (DR_D_D(4) AND NOT(DR_D_D(3)) AND NOT(DR_D_D(2)) AND NOT(DR_D_D(1)) AND DR_D_D(0)) after 5ns;
    DR_D_R18 <= (DR_D_D(4) AND NOT(DR_D_D(3)) AND NOT(DR_D_D(2)) AND DR_D_D(1) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R19 <= (DR_D_D(4) AND NOT(DR_D_D(3)) AND NOT(DR_D_D(2)) AND DR_D_D(1) AND DR_D_D(0)) after 5ns;
    DR_D_R20 <= (DR_D_D(4) AND NOT(DR_D_D(3)) AND DR_D_D(2) AND NOT(DR_D_D(1)) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R21 <= (DR_D_D(4) AND NOT(DR_D_D(3)) AND DR_D_D(2) AND NOT(DR_D_D(1)) AND DR_D_D(0)) after 5ns;
    DR_D_R22 <= (DR_D_D(4) AND NOT(DR_D_D(3)) AND DR_D_D(2) AND DR_D_D(1) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R23 <= (DR_D_D(4) AND NOT(DR_D_D(3)) AND DR_D_D(2) AND DR_D_D(1) AND DR_D_D(0)) after 5ns;
    DR_D_R24 <= (DR_D_D(4) AND DR_D_D(3) AND NOT(DR_D_D(2)) AND NOT(DR_D_D(1)) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R25 <= (DR_D_D(4) AND DR_D_D(3) AND NOT(DR_D_D(2)) AND NOT(DR_D_D(1)) AND DR_D_D(0)) after 5ns;
    DR_D_R26 <= (DR_D_D(4) AND DR_D_D(3) AND NOT(DR_D_D(2)) AND DR_D_D(1) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R27 <= (DR_D_D(4) AND DR_D_D(3) AND NOT(DR_D_D(2)) AND DR_D_D(1) AND DR_D_D(0)) after 5ns;
    DR_D_R28 <= (DR_D_D(4) AND DR_D_D(3) AND DR_D_D(2) AND NOT(DR_D_D(1)) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R29 <= (DR_D_D(4) AND DR_D_D(3) AND DR_D_D(2) AND NOT(DR_D_D(1)) AND DR_D_D(0)) after 5ns;
    DR_D_R30 <= (DR_D_D(4) AND DR_D_D(3) AND DR_D_D(2) AND DR_D_D(1) AND NOT(DR_D_D(0))) after 5ns;
    DR_D_R31 <= (DR_D_D(4) AND DR_D_D(3) AND DR_D_D(2) AND DR_D_D(1) AND DR_D_D(0)) after 5ns;

end Behavioral;
