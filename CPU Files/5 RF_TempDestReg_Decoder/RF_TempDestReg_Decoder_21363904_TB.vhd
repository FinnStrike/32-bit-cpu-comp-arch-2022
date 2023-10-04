----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.10.2022 10:47:46
-- Design Name: 
-- Module Name: RF_TempDestReg_Decoder_21363904_TB - Sim
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

entity RF_TempDestReg_Decoder_21363904_TB is
--  Port ( );
end RF_TempDestReg_Decoder_21363904_TB;

architecture Sim of RF_TempDestReg_Decoder_21363904_TB is

--Components

    component RF_TempDestReg_Decoder_21363904
    port( TDR_D_D : in STD_LOGIC_VECTOR (3 downto 0);
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
    end component;

--Signals
    
    signal in_TB : std_logic_vector (3 downto 0) := (others => '0');
    
    signal out00_TB, out01_TB, out02_TB, out03_TB : std_logic;
    signal out04_TB, out05_TB, out06_TB, out07_TB : std_logic;
    signal out08_TB, out09_TB, out10_TB, out11_TB : std_logic;
    signal out12_TB, out13_TB, out14_TB, out15_TB : std_logic;

begin

--Unit Under Test

    uut: RF_TempDestReg_Decoder_21363904
    PORT MAP( TDR_D_D => in_TB,
              TDR_D_Q00 => out00_TB,
              TDR_D_R01 => out01_TB,
              TDR_D_R02 => out02_TB,
              TDR_D_R03 => out03_TB,
              TDR_D_R04 => out04_TB,
              TDR_D_R05 => out05_TB,
              TDR_D_R06 => out06_TB,
              TDR_D_R07 => out07_TB,
              TDR_D_R08 => out08_TB,
              TDR_D_R09 => out09_TB,
              TDR_D_R10 => out10_TB,
              TDR_D_R11 => out11_TB,
              TDR_D_R12 => out12_TB,
              TDR_D_R13 => out13_TB,
              TDR_D_R14 => out14_TB,
              TDR_D_R15 => out15_TB);

    stim_proc: process
    begin
        
        wait for 20ns;
        in_TB <= "0000";
        
        wait for 20ns;
        in_TB <= "0001";
        
        wait for 20ns;
        in_TB <= "0010";
        
        wait for 20ns;
        in_TB <= "0011";
        
        wait for 20ns;
        in_TB <= "0100";
        
        wait for 20ns;
        in_TB <= "0101";
        
        wait for 20ns;
        in_TB <= "0110";
        
        wait for 20ns;
        in_TB <= "0111";
        
        wait for 20ns;
        in_TB <= "1000";
        
        wait for 20ns;
        in_TB <= "1001";
        
        wait for 20ns;
        in_TB <= "1010";
        
        wait for 20ns;
        in_TB <= "1011";
        
        wait for 20ns;
        in_TB <= "1100";
        
        wait for 20ns;
        in_TB <= "1101";
        
        wait for 20ns;
        in_TB <= "1110";
        
        wait for 20ns;
        in_TB <= "1111";
    
    end process;

end Sim;
