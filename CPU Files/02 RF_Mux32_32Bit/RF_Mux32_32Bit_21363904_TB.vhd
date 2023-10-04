----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.10.2022 10:48:53
-- Design Name: 
-- Module Name: RF_Mux32_32Bit_21363904_TB - Sim
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

entity RF_Mux32_32Bit_21363904_TB is
--  Port ( ); N/A
end RF_Mux32_32Bit_21363904_TB;

architecture Sim of RF_Mux32_32Bit_21363904_TB is

--Components

    component RF_Mux32_32Bit_21363904
    port( M32_s : in  STD_LOGIC_VECTOR (4 downto 0);
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
    end component;
    
--Signals
    
    signal s_TB : std_logic_vector (4 downto 0) := (others => '0');
    signal in00_TB, in01_TB, in02_TB, in03_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in04_TB, in05_TB, in06_TB, in07_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in08_TB, in09_TB, in10_TB, in11_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in12_TB, in13_TB, in14_TB, in15_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in16_TB, in17_TB, in18_TB, in19_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in20_TB, in21_TB, in22_TB, in23_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in24_TB, in25_TB, in26_TB, in27_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in28_TB, in29_TB, in30_TB, in31_TB : std_logic_vector (31 downto 0) := (others => '0');
        
    signal z_TB : std_logic_vector (31 downto 0) := (others => '0');

begin

--Unit Under Test

    uut: RF_Mux32_32Bit_21363904
    PORT MAP( M32_s => s_TB,
              M32_in00 => in00_TB,
              M32_in01 => in01_TB,
              M32_in02 => in02_TB,
              M32_in03 => in03_TB,
              M32_in04 => in04_TB,
              M32_in05 => in05_TB,
              M32_in06 => in06_TB,
              M32_in07 => in07_TB,
              M32_in08 => in08_TB,
              M32_in09 => in09_TB,
              M32_in10 => in10_TB,
              M32_in11 => in11_TB,
              M32_in12 => in12_TB,
              M32_in13 => in13_TB,
              M32_in14 => in14_TB,
              M32_in15 => in15_TB,
              M32_in16 => in16_TB,
              M32_in17 => in17_TB,
              M32_in18 => in18_TB,
              M32_in19 => in19_TB,
              M32_in20 => in20_TB,
              M32_in21 => in21_TB,
              M32_in22 => in22_TB,
              M32_in23 => in23_TB,
              M32_in24 => in24_TB,
              M32_in25 => in25_TB,
              M32_in26 => in26_TB,
              M32_in27 => in27_TB,
              M32_in28 => in28_TB,
              M32_in29 => in29_TB,
              M32_in30 => in30_TB,
              M32_in31 => in31_TB,
              M32_z => z_TB);
              
    stim_proc: process
    begin
        
        wait for 20ns;
        s_TB <= "00000";
        in00_TB <= "00000001010001011111110011000000";
        in01_TB <= "00000001010001011111110011000001";
        in02_TB <= "00000001010001011111110011000010";
        in03_TB <= "00000001010001011111110011000011";
        in04_TB <= "00000001010001011111110011000100";
        in05_TB <= "00000001010001011111110011000101";
        in06_TB <= "00000001010001011111110011000110";
        in07_TB <= "00000001010001011111110011000111";
        in08_TB <= "00000001010001011111110011001000";
        in09_TB <= "00000001010001011111110011001001";
        in10_TB <= "00000001010001011111110011001010";
        in11_TB <= "00000001010001011111110011001011";
        in12_TB <= "00000001010001011111110011001100";
        in13_TB <= "00000001010001011111110011001101";
        in14_TB <= "00000001010001011111110011001110";
        in15_TB <= "00000001010001011111110011001111";
        in16_TB <= "00000001010001011111110011010000";
        in17_TB <= "00000001010001011111110011010001";
        in18_TB <= "00000001010001011111110011010010";
        in19_TB <= "00000001010001011111110011010011";
        in20_TB <= "00000001010001011111110011010100";
        in21_TB <= "00000001010001011111110011010101";
        in22_TB <= "00000001010001011111110011010110";
        in23_TB <= "00000001010001011111110011010111";
        in24_TB <= "00000001010001011111110011011000";
        in25_TB <= "00000001010001011111110011011001";
        in26_TB <= "00000001010001011111110011011010";
        in27_TB <= "00000001010001011111110011011011";
        in28_TB <= "00000001010001011111110011011100";
        in29_TB <= "00000001010001011111110011011101";
        in30_TB <= "00000001010001011111110011011110";
        in31_TB <= "00000001010001011111110011011111";
        
        wait for 20ns;
        s_TB <= "00001";
        
        wait for 20ns;
        s_TB <= "00010";
        
        wait for 20ns;
        s_TB <= "00011";
        
        wait for 20ns;
        s_TB <= "00100";
        
        wait for 20ns;
        s_TB <= "00101";
        
        wait for 20ns;
        s_TB <= "00110";
        
        wait for 20ns;
        s_TB <= "00111";
        
        wait for 20ns;
        s_TB <= "01000";
        
        wait for 20ns;
        s_TB <= "01001";
        
        wait for 20ns;
        s_TB <= "01010";
        
        wait for 20ns;
        s_TB <= "01011";
        
        wait for 20ns;
        s_TB <= "01100";
        
        wait for 20ns;
        s_TB <= "01101";
        
        wait for 20ns;
        s_TB <= "01110";
        
        wait for 20ns;
        s_TB <= "01111";
        
        wait for 20ns;
        s_TB <= "10000";
        
        wait for 20ns;
        s_TB <= "10001";
        
        wait for 20ns;
        s_TB <= "10010";
        
        wait for 20ns;
        s_TB <= "10011";
        
        wait for 20ns;
        s_TB <= "10100";
        
        wait for 20ns;
        s_TB <= "10101";
        
        wait for 20ns;
        s_TB <= "10110";
        
        wait for 20ns;
        s_TB <= "10111";
        
        wait for 20ns;
        s_TB <= "11000";
        
        wait for 20ns;
        s_TB <= "11001";
        
        wait for 20ns;
        s_TB <= "11010";
        
        wait for 20ns;
        s_TB <= "11011";
        
        wait for 20ns;
        s_TB <= "11100";
        
        wait for 20ns;
        s_TB <= "11101";
        
        wait for 20ns;
        s_TB <= "11110";
        
        wait for 20ns;
        s_TB <= "11111";
        
    end process;
    
end Sim;
