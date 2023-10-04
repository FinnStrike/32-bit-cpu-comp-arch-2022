----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 30.11.2022 13:59:03
-- Design Name: 
-- Module Name: CPU_Processor_Test01_21363904_TB - Sim
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

entity CPU_Processor_Test01_21363904_TB is
--  Port ( ); N/A
end CPU_Processor_Test01_21363904_TB;

architecture Sim of CPU_Processor_Test01_21363904_TB is

--Components

    component CPU_Processor_Test01_21363904
      Port ( MW : in STD_LOGIC;
             InstAddress : in STD_LOGIC_VECTOR (31 downto 0);
             MM : in STD_LOGIC;
             Clock : in STD_LOGIC;
             DR : in STD_LOGIC_VECTOR (4 downto 0);
             FS : in STD_LOGIC_VECTOR (4 downto 0);
             IR_IN : in STD_LOGIC_VECTOR (31 downto 0);
             MB : in STD_LOGIC;
             MD : in STD_LOGIC;
             RW : in STD_LOGIC;
             SA : in STD_LOGIC_VECTOR (4 downto 0);
             SB : in STD_LOGIC_VECTOR (4 downto 0);
             TA : in STD_LOGIC_VECTOR (3 downto 0);
             TB : in STD_LOGIC_VECTOR (3 downto 0);
             TD : in STD_LOGIC_VECTOR (3 downto 0);
             C : out STD_LOGIC;
             N : out STD_LOGIC;
             V : out STD_LOGIC;
             Z : out STD_LOGIC);
    end component;

--Signals

    signal instadr_TB, ir_in_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal dr_TB, fs_TB, sa_TB, sb_TB : std_logic_vector (4 downto 0) := (others => '0');
    signal ta_TB, tb_TB, td_TB : std_logic_vector (3 downto 0) := (others => '0');
    signal mw_TB, mm_TB, clk_TB, mb_TB, md_TB, rw_TB : std_logic := '0';
    
    signal c_TB, n_TB, v_TB, z_TB : std_logic := '0';

begin

--Unit Under Test

    uut : CPU_Processor_Test01_21363904
    PORT MAP ( MW => mw_TB,
               InstAddress => instadr_TB,
               MM => mm_TB,
               Clock => clk_TB,
               DR => dr_TB,
               FS => fs_TB,
               IR_IN => ir_in_TB,
               MB => mb_TB,
               MD => md_TB,
               RW => rw_TB,
               SA => sa_TB,
               SB => sb_TB,
               TA => ta_TB,
               TB => tb_TB,
               TD => td_TB,
               C => c_TB,
               N => n_TB,
               V => v_TB,
               Z => z_TB);
               
    clk_TB <= not clk_TB after 180ns;
    
    stim_proc : process
    begin
        
--Load all registers
        
        wait until clk_TB' event and clk_TB = '1';
        mw_TB <= '0';
        fs_TB <= "00000";
        ir_in_TB <= X"00000000";
        mb_TB <= '0';
        sa_TB <= "00000";
        sb_TB <= "00000";
        ta_TB <= "0000";
        tb_TB <= "0000";
        td_TB <= "0000";
        md_TB <= '1' after 5ns;
        rw_TB <= '1' after 5ns;
        dr_TB <= "00000" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000000" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00000" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "00001" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000001" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00001" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "00010" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000002" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00010" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "00011" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000003" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00011" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "00100" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000004" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00100" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "00101" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000005" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00101" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "00110" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000006" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00110" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "00111" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000007" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00111" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "01000" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000008" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "01000" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "01001" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000009" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "01001" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "01010" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000000A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "01010" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "01011" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000000B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "01011" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "01100" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000000C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "01100" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "01101" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000000D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "01101" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "01110" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000000E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "01110" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "01111" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000000F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "01111" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "10000" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000010" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "10000" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "10001" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000011" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "10001" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "10010" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000012" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "10010" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "10011" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000013" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "10011" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "10100" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000014" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "10100" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "10101" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000015" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "10101" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "10110" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000016" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "10110" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "10111" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000017" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "10111" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "11000" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000018" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "11000" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "11001" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000019" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "11001" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "11010" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000001A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "11010" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "11011" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000001B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "11011" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "11100" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000001C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "11100" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "11101" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000001D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "11101" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "11110" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000001E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "11110" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "11111" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000001F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "11111" after 5ns;
        
--Load Temp Registers

        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "00000" after 5ns;
        sa_TB <= "00000" after 5ns;
        td_TB <= "0001" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000020" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "0001" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "0010" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000021" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "0010" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "0011" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000022" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "0011" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "0100" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000023" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "0100" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "0101" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000024" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "0101" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "0110" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000025" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "0110" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "0111" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000026" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "0111" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "1000" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000027" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "1000" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "1001" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000028" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "1001" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "1010" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"00000029" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "1010" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "1011" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000002A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "1011" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "1100" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000002B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "1100" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "1101" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000002C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "1101" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "1110" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000002D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "1110" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        td_TB <= "1111" after 5ns;
        mm_TB <= '1' after 5ns;
        instadr_TB <= X"0000002E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        ta_TB <= "1111" after 5ns;
        
--Select Source Registers

        wait until clk_TB' event and clk_TB = '1';
        md_TB <= '0' after 5ns;
        td_TB <= "0000" after 5ns;
        ta_TB <= "0000" after 5ns;
        sa_TB <= "00100" after 5ns; --> 0x08
        sb_TB <= "00101" after 5ns; --> 0x09
        
--Perform Datapath Microoperations

        -- F = A + NOT(B) + 1 = 00000008 + FFFFFFF6 + 1 = FFFFFFFF
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00101" after 5ns;
        dr_TB <= "00110" after 5ns;
        
        -- F = NOT(A) = NOT(00000008) = FFFFFFF7
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01110" after 5ns;
        dr_TB <= "00111" after 5ns;
        
        -- F = A + NOT(B) = 00000008 + FFFFFFF6 = FFFFFFFE
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00100" after 5ns;
        dr_TB <= "01000" after 5ns;
        
        -- F = A = 00000008 [FS = 00111]
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00111" after 5ns;
        dr_TB <= "01001" after 5ns;
        
        -- F = A + B + 1 = 00000008 + 00000009 + 1 = 00000012
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00011" after 5ns;
        dr_TB <= "01010" after 5ns;
        
        -- F = B>> = LSR(00000009) = 00000004
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "10100" after 5ns;
        dr_TB <= "01011" after 5ns;
        
        -- F = A + B = 00000008 + 00000009 = 00000011
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00010" after 5ns;
        dr_TB <= "01100" after 5ns;
        
        -- F = B<< = LSL(00000009) = 00000012
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "11000" after 5ns;
        dr_TB <= "01101" after 5ns;
        
        -- F = A = 00000008 [FS = 00000]
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00000" after 5ns;
        dr_TB <= "01110" after 5ns;
        
        -- F = B = 00000009
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "10000" after 5ns;
        dr_TB <= "01111" after 5ns;
        
        -- F = A + 1 = 00000008 + 1 = 00000009
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00001" after 5ns;
        dr_TB <= "10000" after 5ns;
        
        -- F = A XOR B = 00000008 XOR 00000009 = 00000001
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01100" after 5ns;
        dr_TB <= "10001" after 5ns;
        
        -- F = A OR B = 00000008 OR 00000009 = 00000009
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01010" after 5ns;
        dr_TB <= "10010" after 5ns;
        
        -- F = A - 1 = 00000008 - 1 = 00000007
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00110" after 5ns;
        dr_TB <= "10011" after 5ns;
        
        -- F = A AND B = 00000008 AND 00000009 = 00000008
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01000" after 5ns;
        dr_TB <= "10100" after 5ns;
        
--Store results in RAM

        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00000" after 5ns;
        dr_TB <= "00000" after 5ns;
        rw_TB <= '0' after 5ns;
        mw_TB <= '1' after 5ns;
        sb_TB <= "00110" after 5ns;
        instadr_TB <= X"00000000" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "00111" after 5ns;
        instadr_TB <= X"00000001" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "01000" after 5ns;
        instadr_TB <= X"00000002" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "01001" after 5ns;
        instadr_TB <= X"00000003" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "01010" after 5ns;
        instadr_TB <= X"00000004" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "01011" after 5ns;
        instadr_TB <= X"00000005" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "01100" after 5ns;
        instadr_TB <= X"00000006" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "01101" after 5ns;
        instadr_TB <= X"00000007" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "01110" after 5ns;
        instadr_TB <= X"00000008" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "01111" after 5ns;
        instadr_TB <= X"00000009" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "10000" after 5ns;
        instadr_TB <= X"0000000A" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "10001" after 5ns;
        instadr_TB <= X"0000000B" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "10010" after 5ns;
        instadr_TB <= X"0000000C" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "10011" after 5ns;
        instadr_TB <= X"0000000D" after 5ns;

        wait until clk_TB'event and clk_TB = '1';
        mw_TB <= '1' after 5ns;
        sb_TB <= "10100" after 5ns;
        instadr_TB <= X"0000000E" after 5ns;
       
--Load RAM into Register 1

        wait until clk_TB' event and clk_TB = '1';
        md_TB <= '1' after 5ns;
        mw_TB <= '0' after 5ns;
        sb_TB <= "00000" after 5ns;
        dr_TB <= "00001" after 5ns;
        rw_TB <= '1' after 5ns;
        sa_TB <= "00001" after 5ns;
        instadr_TB <= X"00000000" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"00000001" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"00000002" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"00000003" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"00000004" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"00000005" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"00000006" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"00000007" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"00000008" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"00000009" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"0000000A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"0000000B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"0000000C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"0000000D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        instadr_TB <= X"0000000E" after 5ns;
    
    end process;

end Sim;
