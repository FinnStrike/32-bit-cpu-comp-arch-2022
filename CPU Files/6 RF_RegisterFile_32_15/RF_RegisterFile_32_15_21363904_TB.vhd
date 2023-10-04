----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.10.2022 10:47:46
-- Design Name: 
-- Module Name: RF_RegisterFile_32_15_21363904_TB - Sim
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

entity RF_RegisterFile_32_15_21363904_TB is
--  Port ( ); N/A
end RF_RegisterFile_32_15_21363904_TB;

architecture Sim of RF_RegisterFile_32_15_21363904_TB is

--Components

    component RF_RegisterFile_32_15_21363904
    port( SA : in STD_LOGIC_VECTOR (4 downto 0);   
          SB : in STD_LOGIC_VECTOR (4 downto 0);   
          DR : in STD_LOGIC_VECTOR (4 downto 0);   
          RW : in STD_LOGIC;                       
          Clock : in STD_LOGIC;                    
          D : in STD_LOGIC_VECTOR (31 downto 0);   
          TA : in STD_LOGIC_VECTOR (3 downto 0);   
          TB : in STD_LOGIC_VECTOR (3 downto 0);   
          TD : in STD_LOGIC_VECTOR (3 downto 0);                                   
          A : out STD_LOGIC_VECTOR (31 downto 0);  
          B : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal sa_TB, sb_TB, dr_TB : std_logic_vector (4 downto 0) := (others => '0');
    signal rw_TB, clk_TB : std_logic := '0';
    signal d_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal ta_TB, tb_TB, td_TB : std_logic_vector (3 downto 0) := (others => '0');
    
    signal a_TB, b_TB : std_logic_vector (31 downto 0) := (others => '0');

begin

--Unit Under Test

    uut: RF_RegisterFile_32_15_21363904
    PORT MAP( SA => sa_TB,
              SB => sb_TB,
              DR => dr_TB,
              RW => rw_TB,
              Clock => clk_TB,
              D => d_TB,
              TA => ta_TB,
              TB => tb_TB,
              TD => td_TB,
              A => a_TB,
              B => b_TB);
              
    clk_TB <= not clk_TB after 10ns;
    
    stim_proc: process
    begin
    
--Registers (alternating between write/read and port A / port B)
    
        wait until clk_TB'event and clk_TB='1';
        rw_TB <= '1';
        td_TB <= "0000";
        ta_TB <= "0000";
        tb_TB <= "0000";
        sa_TB <= "00000";
        sb_TB <= "00000";
        dr_TB <= "00000";
        d_TB <= "00000001010001011111110011000000";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "00000";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "00001";
        d_TB <= "00000001010001011111110011000001";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "00001";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "00010";
        d_TB <= "00000001010001011111110011000010";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "00010";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "00011";
        d_TB <= "00000001010001011111110011000011";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "00011";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "00100";
        d_TB <= "00000001010001011111110011000100";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "00100";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "00101";
        d_TB <= "00000001010001011111110011000101";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "00101";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "00110";
        d_TB <= "00000001010001011111110011000110";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "00110";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "00111";
        d_TB <= "00000001010001011111110011000111";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "00111";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "01000";
        d_TB <= "00000001010001011111110011001000";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "01000";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "01001";
        d_TB <= "00000001010001011111110011001001";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "01001";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "01010";
        d_TB <= "00000001010001011111110011001010";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "01010";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "01011";
        d_TB <= "00000001010001011111110011001011";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "01011";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "01100";
        d_TB <= "00000001010001011111110011001100";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "01100";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "01101";
        d_TB <= "00000001010001011111110011001101";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "01101";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "01110";
        d_TB <= "00000001010001011111110011001110";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "01110";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "01111";
        d_TB <= "00000001010001011111110011001111";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "01111";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "10000";
        d_TB <= "00000001010001011111110011010000";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "10000";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "10001";
        d_TB <= "00000001010001011111110011010001";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "10001";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "10010";
        d_TB <= "00000001010001011111110011010010";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "10010";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "10011";
        d_TB <= "00000001010001011111110011010011";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "10011";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "10100";
        d_TB <= "00000001010001011111110011010100";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "10100";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "10101";
        d_TB <= "00000001010001011111110011010101";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "10101";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "10110";
        d_TB <= "00000001010001011111110011010110";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "10110";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "10111";
        d_TB <= "00000001010001011111110011010111";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "10111";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "11000";
        d_TB <= "00000001010001011111110011011000";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "11000";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "11001";
        d_TB <= "00000001010001011111110011011001";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "11001";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "11010";
        d_TB <= "00000001010001011111110011011010";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "11010";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "11011";
        d_TB <= "00000001010001011111110011011011";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "11011";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "11100";
        d_TB <= "00000001010001011111110011011100";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "11100";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "11101";
        d_TB <= "00000001010001011111110011011101";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "11101";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "11110";
        d_TB <= "00000001010001011111110011011110";
        
        wait until clk_TB'event and clk_TB='1';
        sa_TB <= "11110";
        
        wait until clk_TB'event and clk_TB='1';
        dr_TB <= "11111";
        d_TB <= "00000001010001011111110011011111";
        
        wait until clk_TB'event and clk_TB='1';
        sb_TB <= "11111";
        
--TempRegisters (alternating between write/read and port A / port B)
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "0001";
        ta_TB <= "0000";
        tb_TB <= "0000";
        sa_TB <= "00000";
        sb_TB <= "00000";
        dr_TB <= "00000";
        d_TB <= "00000001010001011111110011100000";
        
        wait until clk_TB'event and clk_TB='1';
        tb_TB <= "0001";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "0010";
        d_TB <= "00000001010001011111110011100001";
        
        wait until clk_TB'event and clk_TB='1';
        ta_TB <= "0010";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "0011";
        d_TB <= "00000001010001011111110011100010";
        
        wait until clk_TB'event and clk_TB='1';
        tb_TB <= "0011";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "0100";
        d_TB <= "00000001010001011111110011100011";
        
        wait until clk_TB'event and clk_TB='1';
        ta_TB <= "0100";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "0101";
        d_TB <= "00000001010001011111110011100100";
        
        wait until clk_TB'event and clk_TB='1';
        tb_TB <= "0101";
       
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "0110";
        d_TB <= "00000001010001011111110011100101";
        
        wait until clk_TB'event and clk_TB='1';
        ta_TB <= "0110";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "0111";
        d_TB <= "00000001010001011111110011100110";
        
        wait until clk_TB'event and clk_TB='1';
        tb_TB <= "0111";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "1000";
        d_TB <= "00000001010001011111110011100111";
        
        wait until clk_TB'event and clk_TB='1';
        ta_TB <= "1000";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "1001";
        d_TB <= "00000001010001011111110011101000";
        
        wait until clk_TB'event and clk_TB='1';
        tb_TB <= "1001";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "1010";
        d_TB <= "00000001010001011111110011101001";
        
        wait until clk_TB'event and clk_TB='1';
        ta_TB <= "1010";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "1011";
        d_TB <= "00000001010001011111110011101010";
        
        wait until clk_TB'event and clk_TB='1';
        tb_TB <= "1011";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "1100";
        d_TB <= "00000001010001011111110011101011";
        
        wait until clk_TB'event and clk_TB='1';
        ta_TB <= "1100";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "1101";
        d_TB <= "00000001010001011111110011101100";
        
        wait until clk_TB'event and clk_TB='1';
        tb_TB <= "1101";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "1110";
        d_TB <= "00000001010001011111110011101101";
        
        wait until clk_TB'event and clk_TB='1';
        ta_TB <= "1110";
        
        wait until clk_TB'event and clk_TB='1';
        td_TB <= "1111";
        d_TB <= "00000001010001011111110011101110";
        
        wait until clk_TB'event and clk_TB='1';
        tb_TB <= "1111";
        
    end process;

end Sim;
