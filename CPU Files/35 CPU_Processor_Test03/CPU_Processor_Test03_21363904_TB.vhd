----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 19.12.2022 21:24:14
-- Design Name: 
-- Module Name: CPU_Processor_Test03_21363904_TB - Sim
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

entity CPU_Processor_Test03_21363904_TB is
--  Port ( ); N/A
end CPU_Processor_Test03_21363904_TB;

architecture Sim of CPU_Processor_Test03_21363904_TB is

--Components

    component CPU_Processor_Test03_21363904
      Port ( MM : in STD_LOGIC;
             MW : in STD_LOGIC;
             FS : in STD_LOGIC_VECTOR (4 downto 0);
             MB : in STD_LOGIC;
             MD : in STD_LOGIC;
             RW : in STD_LOGIC;
             TA : in STD_LOGIC_VECTOR (3 downto 0);
             TB : in STD_LOGIC_VECTOR (3 downto 0);
             IL : in STD_LOGIC;
             TD : in STD_LOGIC_VECTOR (3 downto 0);
             Clock : in STD_LOGIC;
             LoadFlags : in STD_LOGIC;
             PI : in STD_LOGIC;
             PL : in STD_LOGIC;
             Reset : in STD_LOGIC;
             Reset_C : in STD_LOGIC;
             Reset_N : in STD_LOGIC;
             Reset_V : in STD_LOGIC;
             Reset_Z : in STD_LOGIC;
             Opcode : out STD_LOGIC_VECTOR (16 downto 0);
             StatusVector : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
--Signals

    signal fs_TB : std_logic_vector (4 downto 0) := (others => '0');
    signal ta_TB, tb_TB, td_TB : std_logic_vector (3 downto 0) := (others => '0');
    signal mw_TB, mm_TB, clk_TB, mb_TB, md_TB, rw_TB, pi_TB, reset_TB : std_logic := '0';
    signal load_TB, rc_TB, rn_TB, rv_TB, rz_TB, il_TB, pl_TB : std_logic := '0';
    
    signal opcode_TB : std_logic_vector (16 downto 0) := (others => '0');
    signal statvec_TB : std_logic_vector (3 downto 0) := (others => '0');

begin

--Unit Under Test

    uut : CPU_Processor_Test03_21363904
    PORT MAP ( MM => mm_TB,
               MW => mw_TB,
               FS => fs_TB,
               MB => mb_TB,
               MD => md_TB,
               RW => rw_TB,
               TA => ta_TB,
               TB => tb_TB,
               IL => il_TB,
               TD => td_TB,
               Clock => clk_TB,
               LoadFlags => load_TB,
               PI => pi_TB,
               PL => pl_TB,
               Reset => reset_TB,
               Reset_C => rc_TB,
               Reset_N => rn_TB,
               Reset_V => rv_TB,
               Reset_Z => rz_TB,
               Opcode => opcode_TB,
               StatusVector => statvec_TB);
               
    clk_TB <= not clk_TB after 180ns;
    
    stim_proc : process
    begin
    
        --Reset to first instruction - adr 04
        wait until clk_TB' event and clk_TB = '1';
        mw_TB <= '0';
        fs_TB <= "00000";
        mb_TB <= '0';
        md_TB <= '0';
        rw_TB <= '0';
        ta_TB <= "0000";
        tb_TB <= "0000";
        td_TB <= "0000";
        load_TB <= '0';
        rc_TB <= '0';
        rn_TB <= '0';
        rv_TB <= '0';
        rz_TB <= '0';
        pi_TB <= '0';
        pl_TB <= '0';
        mm_TB <= '1' after 5ns;
        il_TB <= '1' after 5ns;
        reset_TB <= '1' after 5ns;
        
        --Fetch second instruction - adr 05
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0' after 5ns;
        pi_TB <= '1' after 5ns;
        
        --Fetch third instruction - adr 06
        wait until clk_TB' event and clk_TB = '1';
        pi_TB <= '1' after 5ns;
        
        --Fetch fourth instruction - adr 07
        wait until clk_TB' event and clk_TB = '1';
        pi_TB <= '1' after 5ns;
        
        --Fetch fifth instruction - adr 08
        wait until clk_TB' event and clk_TB = '1';
        pi_TB <= '1' after 5ns;
        
        --Displace to first address in RAM (00)
        wait until clk_TB' event and clk_TB = '1';
        pi_TB <= '0' after 5ns;
        
        --Remain at first address in RAM (00)
        wait until clk_TB' event and clk_TB = '1';
        pl_TB <= '1' after 5ns;
        
    end process;

end Sim;
