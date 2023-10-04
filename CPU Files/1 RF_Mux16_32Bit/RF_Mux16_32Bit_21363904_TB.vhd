----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.10.2022 10:48:15
-- Design Name: 
-- Module Name: RF_Mux16_32Bit_21363904_TB - Sim
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

entity RF_Mux16_32Bit_21363904_TB is
--  Port ( ); N/A
end RF_Mux16_32Bit_21363904_TB;

architecture Sim of RF_Mux16_32Bit_21363904_TB is

--Components

    component RF_Mux16_32Bit_21363904
    port( M16_s : in  STD_LOGIC_VECTOR (3 downto 0);
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
    end component;
    
--Signals
    
    signal s_TB : std_logic_vector (3 downto 0) := (others => '0');
    signal in00_TB, in01_TB, in02_TB, in03_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in04_TB, in05_TB, in06_TB, in07_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in08_TB, in09_TB, in10_TB, in11_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal in12_TB, in13_TB, in14_TB, in15_TB : std_logic_vector (31 downto 0) := (others => '0');
        
    signal z_TB : std_logic_vector (31 downto 0) := (others => '0');

begin

--Unit Under Test

    uut: RF_Mux16_32Bit_21363904
    PORT MAP( M16_s => s_TB,
              M16_in00 => in00_TB,
              M16_in01 => in01_TB,
              M16_in02 => in02_TB,
              M16_in03 => in03_TB,
              M16_in04 => in04_TB,
              M16_in05 => in05_TB,
              M16_in06 => in06_TB,
              M16_in07 => in07_TB,
              M16_in08 => in08_TB,
              M16_in09 => in09_TB,
              M16_in10 => in10_TB,
              M16_in11 => in11_TB,
              M16_in12 => in12_TB,
              M16_in13 => in13_TB,
              M16_in14 => in14_TB,
              M16_in15 => in15_TB,
              M16_z => z_TB);
              
    stim_proc: process
    begin
        
        wait for 20ns;
        s_TB <= "0000";
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
        
        wait for 20ns;
        s_TB <= "0001";
        
        wait for 20ns;
        s_TB <= "0010";
        
        wait for 20ns;
        s_TB <= "0011";
        
        wait for 20ns;
        s_TB <= "0100";
        
        wait for 20ns;
        s_TB <= "0101";
        
        wait for 20ns;
        s_TB <= "0110";
        
        wait for 20ns;
        s_TB <= "0111";
        
        wait for 20ns;
        s_TB <= "1000";
        
        wait for 20ns;
        s_TB <= "1001";
        
        wait for 20ns;
        s_TB <= "1010";
        
        wait for 20ns;
        s_TB <= "1011";
        
        wait for 20ns;
        s_TB <= "1100";
        
        wait for 20ns;
        s_TB <= "1101";
        
        wait for 20ns;
        s_TB <= "1110";
        
        wait for 20ns;
        s_TB <= "1111";
        
    end process;
    
end Sim;
