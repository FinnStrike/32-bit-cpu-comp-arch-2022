----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 04.12.2022 20:53:38
-- Design Name: 
-- Module Name: CPU_Processor_Test02_21363904_TB - Sim
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

entity CPU_Processor_Test02_21363904_TB is
--  Port ( ); N/A
end CPU_Processor_Test02_21363904_TB;

architecture Sim of CPU_Processor_Test02_21363904_TB is

--Components

    component CPU_Processor_Test02_21363904
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
             LoadFlags : in STD_LOGIC;
             Reset_C : in STD_LOGIC;
             Reset_N : in STD_LOGIC;
             Reset_V : in STD_LOGIC;
             Reset_Z : in STD_LOGIC;
             StatusVector : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

--Signals

    signal instadr_TB, ir_in_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal dr_TB, fs_TB, sa_TB, sb_TB : std_logic_vector (4 downto 0) := (others => '0');
    signal ta_TB, tb_TB, td_TB : std_logic_vector (3 downto 0) := (others => '0');
    signal mw_TB, mm_TB, clk_TB, mb_TB, md_TB, rw_TB : std_logic := '0';
    signal load_TB, rc_TB, rn_TB, rv_TB, rz_TB : std_logic := '0';
    
    signal statvec_TB : std_logic_vector (3 downto 0):= (others => '0');

begin

--Unit Under Test

    uut : CPU_Processor_Test02_21363904
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
               LoadFlags => load_TB,
               Reset_C => rc_TB,
               Reset_N => rn_TB,
               Reset_V => rv_TB,
               Reset_Z => rz_TB,
               StatusVector => statvec_TB);
               
    clk_TB <= not clk_TB after 180ns;
    
    stim_proc : process
    begin
    
        wait until clk_TB' event and clk_TB = '1';
        fs_TB <= "00000";
        mb_TB <= '0';
        sa_TB <= "00000";
        sb_TB <= "00000";
        ta_TB <= "0000";
        tb_TB <= "0000";
        td_TB <= "0000";
        rc_TB <= '0';
        rn_TB <= '0';
        rv_TB <= '0';
        rz_TB <= '0';
        rw_TB <= '0';
        dr_TB <= "00000";
        load_TB <= '0';
        md_TB <= '1' after 5ns;
        mm_TB <= '1' after 5ns;
        mw_TB <= '1' after 5ns;
        mb_TB <= '1' after 5ns;
        ir_in_TB <= X"00000000" after 5ns;
        instadr_TB <= X"00000000" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        ir_in_TB <= X"00000001" after 5ns;
        instadr_TB <= X"00000001" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        ir_in_TB <= X"7FFFFFFF" after 5ns;
        instadr_TB <= X"00000002" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        ir_in_TB <= X"FFFFFFFF" after 5ns;
        instadr_TB <= X"00000003" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        mw_TB <= '0' after 5ns;
        mb_TB <= '0' after 5ns;
        rw_TB <= '1' after 5ns;
        dr_TB <= "00000" after 5ns;
        instadr_TB <= X"00000000" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00000" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "00111" after 5ns;
        instadr_TB <= X"00000001" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "00111" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "01111" after 5ns;
        instadr_TB <= X"00000002" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "01111" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        dr_TB <= "11111" after 5ns;
        instadr_TB <= X"00000003" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        sa_TB <= "11111" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        rw_TB <= '0' after 5ns;
        load_TB <= '1'after 5ns;
        sa_TB <= "00111" after 5ns;
        sb_TB <= "11111" after 5ns;
        fs_TB <= "00010" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        load_TB <= '0'after 5ns;
        rc_TB <= '1' after 5ns;
        rn_TB <= '1' after 5ns;
        rv_TB <= '1' after 5ns;
        rz_TB <= '1' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        rc_TB <= '0' after 5ns;
        rn_TB <= '0' after 5ns;
        rv_TB <= '0' after 5ns;
        rz_TB <= '0' after 5ns;
        load_TB <= '1'after 5ns;
        sa_TB <= "00111" after 5ns;
        sb_TB <= "01111" after 5ns;
        fs_TB <= "00010" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        load_TB <= '0'after 5ns;
        rc_TB <= '1' after 5ns;
        rn_TB <= '1' after 5ns;
        rv_TB <= '1' after 5ns;
        rz_TB <= '1' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        rc_TB <= '0' after 5ns;
        rn_TB <= '0' after 5ns;
        rv_TB <= '0' after 5ns;
        rz_TB <= '0' after 5ns;
        load_TB <= '1'after 5ns;
        sa_TB <= "00000" after 5ns;
        sb_TB <= "11111" after 5ns;
        fs_TB <= "01000" after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        load_TB <= '0'after 5ns;
        rc_TB <= '1' after 5ns;
        rn_TB <= '1' after 5ns;
        rv_TB <= '1' after 5ns;
        rz_TB <= '1' after 5ns;
    
    end process;

end Sim;
