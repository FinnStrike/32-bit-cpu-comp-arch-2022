----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.10.2022 10:47:46
-- Design Name: 
-- Module Name: RF_DestReg_Decoder_21363904_TB - Sim
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

entity RF_DestReg_Decoder_21363904_TB is
--  Port ( );
end RF_DestReg_Decoder_21363904_TB;

architecture Sim of RF_DestReg_Decoder_21363904_TB is

--Components

    component RF_DestReg_Decoder_21363904
    port( DR_D_D : in STD_LOGIC_VECTOR (4 downto 0);
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
    end component;

--Signals
    
    signal in_TB : std_logic_vector (4 downto 0) := (others => '0');
    
    signal out00_TB, out01_TB, out02_TB, out03_TB : std_logic;
    signal out04_TB, out05_TB, out06_TB, out07_TB : std_logic;
    signal out08_TB, out09_TB, out10_TB, out11_TB : std_logic;
    signal out12_TB, out13_TB, out14_TB, out15_TB : std_logic;
    signal out16_TB, out17_TB, out18_TB, out19_TB : std_logic;
    signal out20_TB, out21_TB, out22_TB, out23_TB : std_logic;
    signal out24_TB, out25_TB, out26_TB, out27_TB : std_logic;
    signal out28_TB, out29_TB, out30_TB, out31_TB : std_logic;

begin

--Unit Under Test

    uut: RF_DestReg_Decoder_21363904
    PORT MAP( DR_D_D => in_TB,
              DR_D_R00 => out00_TB,
              DR_D_R01 => out01_TB,
              DR_D_R02 => out02_TB,
              DR_D_R03 => out03_TB,
              DR_D_R04 => out04_TB,
              DR_D_R05 => out05_TB,
              DR_D_R06 => out06_TB,
              DR_D_R07 => out07_TB,
              DR_D_R08 => out08_TB,
              DR_D_R09 => out09_TB,
              DR_D_R10 => out10_TB,
              DR_D_R11 => out11_TB,
              DR_D_R12 => out12_TB,
              DR_D_R13 => out13_TB,
              DR_D_R14 => out14_TB,
              DR_D_R15 => out15_TB,
              DR_D_R16 => out16_TB,
              DR_D_R17 => out17_TB,
              DR_D_R18 => out18_TB,
              DR_D_R19 => out19_TB,
              DR_D_R20 => out20_TB,
              DR_D_R21 => out21_TB,
              DR_D_R22 => out22_TB,
              DR_D_R23 => out23_TB,
              DR_D_R24 => out24_TB,
              DR_D_R25 => out25_TB,
              DR_D_R26 => out26_TB,
              DR_D_R27 => out27_TB,
              DR_D_R28 => out28_TB,
              DR_D_R29 => out29_TB,
              DR_D_R30 => out30_TB,
              DR_D_R31 => out31_TB);

    stim_proc: process
    begin
    
        wait for 20ns;
        in_TB <= "00000";
        
        wait for 20ns;
        in_TB <= "00001";
        
        wait for 20ns;
        in_TB <= "00010";
        
        wait for 20ns;
        in_TB <= "00011";
        
        wait for 20ns;
        in_TB <= "00100";
        
        wait for 20ns;
        in_TB <= "00101";
        
        wait for 20ns;
        in_TB <= "00110";
        
        wait for 20ns;
        in_TB <= "00111";
        
        wait for 20ns;
        in_TB <= "01000";
        
        wait for 20ns;
        in_TB <= "01001";
        
        wait for 20ns;
        in_TB <= "01010";
        
        wait for 20ns;
        in_TB <= "01011";
        
        wait for 20ns;
        in_TB <= "01100";
        
        wait for 20ns;
        in_TB <= "01101";
        
        wait for 20ns;
        in_TB <= "01110";
        
        wait for 20ns;
        in_TB <= "01111";
        
        wait for 20ns;
        in_TB <= "10000";
        
        wait for 20ns;
        in_TB <= "10001";
        
        wait for 20ns;
        in_TB <= "10010";
        
        wait for 20ns;
        in_TB <= "10011";
        
        wait for 20ns;
        in_TB <= "10100";
        
        wait for 20ns;
        in_TB <= "10101";
        
        wait for 20ns;
        in_TB <= "10110";
        
        wait for 20ns;
        in_TB <= "10111";
        
        wait for 20ns;
        in_TB <= "11000";
        
        wait for 20ns;
        in_TB <= "11001";
        
        wait for 20ns;
        in_TB <= "11010";
        
        wait for 20ns;
        in_TB <= "11011";
        
        wait for 20ns;
        in_TB <= "11100";
        
        wait for 20ns;
        in_TB <= "11101";
        
        wait for 20ns;
        in_TB <= "11110";
        
        wait for 20ns;
        in_TB <= "11111";
    
    end process;

end Sim;
