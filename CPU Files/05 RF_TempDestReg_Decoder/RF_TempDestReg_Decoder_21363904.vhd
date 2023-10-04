----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 10/19/2022 11:53:46 AM
-- Design Name: 
-- Module Name: RF_TempDestReg_Decoder_21363904 - Behavioral
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

entity RF_TempDestReg_Decoder_21363904 is
  Port ( TDR_D_D : in STD_LOGIC_VECTOR (3 downto 0);
         TDR_D_Q00 : out std_logic;
         TDR_D_R01 : out std_logic;
         TDR_D_R02 : out std_logic;
         TDR_D_R03 : out std_logic;
         TDR_D_R04 : out std_logic;
         TDR_D_R05 : out std_logic;
         TDR_D_R06 : out std_logic;
         TDR_D_R07 : out std_logic;
         TDR_D_R08 : out std_logic;
         TDR_D_R09 : out std_logic;
         TDR_D_R10 : out std_logic;
         TDR_D_R11 : out std_logic;
         TDR_D_R12 : out std_logic;
         TDR_D_R13 : out std_logic;
         TDR_D_R14 : out std_logic;
         TDR_D_R15 : out std_logic);
end RF_TempDestReg_Decoder_21363904;

architecture Behavioral of RF_TempDestReg_Decoder_21363904 is

begin
    
    TDR_D_Q00 <= (NOT(TDR_D_D(3)) AND NOT(TDR_D_D(2)) AND NOT(TDR_D_D(1)) AND NOT(TDR_D_D(0))) after 5ns;
    TDR_D_R01 <= (NOT(TDR_D_D(3)) AND NOT(TDR_D_D(2)) AND NOT(TDR_D_D(1)) AND TDR_D_D(0)) after 5ns;
    TDR_D_R01 <= (NOT(TDR_D_D(3)) AND NOT(TDR_D_D(2)) AND NOT(TDR_D_D(1)) AND TDR_D_D(0)) after 5ns;
    TDR_D_R02 <= (NOT(TDR_D_D(3)) AND NOT(TDR_D_D(2)) AND TDR_D_D(1) AND NOT(TDR_D_D(0))) after 5ns;
    TDR_D_R03 <= (NOT(TDR_D_D(3)) AND NOT(TDR_D_D(2)) AND TDR_D_D(1) AND TDR_D_D(0)) after 5ns;
    TDR_D_R04 <= (NOT(TDR_D_D(3)) AND TDR_D_D(2) AND NOT(TDR_D_D(1)) AND NOT(TDR_D_D(0))) after 5ns;
    TDR_D_R05 <= (NOT(TDR_D_D(3)) AND TDR_D_D(2) AND NOT(TDR_D_D(1)) AND TDR_D_D(0)) after 5ns;
    TDR_D_R06 <= (NOT(TDR_D_D(3)) AND TDR_D_D(2) AND TDR_D_D(1) AND NOT(TDR_D_D(0))) after 5ns;
    TDR_D_R07 <= (NOT(TDR_D_D(3)) AND TDR_D_D(2) AND TDR_D_D(1) AND TDR_D_D(0)) after 5ns;
    TDR_D_R08 <= (TDR_D_D(3) AND NOT(TDR_D_D(2)) AND NOT(TDR_D_D(1)) AND NOT(TDR_D_D(0))) after 5ns;
    TDR_D_R09 <= (TDR_D_D(3) AND NOT(TDR_D_D(2)) AND NOT(TDR_D_D(1)) AND TDR_D_D(0)) after 5ns;
    TDR_D_R10 <= (TDR_D_D(3) AND NOT(TDR_D_D(2)) AND TDR_D_D(1) AND NOT(TDR_D_D(0))) after 5ns;
    TDR_D_R11 <= (TDR_D_D(3) AND NOT(TDR_D_D(2)) AND TDR_D_D(1) AND TDR_D_D(0)) after 5ns;
    TDR_D_R12 <= (TDR_D_D(3) AND TDR_D_D(2) AND NOT(TDR_D_D(1)) AND NOT(TDR_D_D(0))) after 5ns;
    TDR_D_R13 <= (TDR_D_D(3) AND TDR_D_D(2) AND NOT(TDR_D_D(1)) AND TDR_D_D(0)) after 5ns;
    TDR_D_R14 <= (TDR_D_D(3) AND TDR_D_D(2) AND TDR_D_D(1) AND NOT(TDR_D_D(0))) after 5ns;
    TDR_D_R15 <= (TDR_D_D(3) AND TDR_D_D(2) AND TDR_D_D(1) AND TDR_D_D(0)) after 5ns;

end Behavioral;
