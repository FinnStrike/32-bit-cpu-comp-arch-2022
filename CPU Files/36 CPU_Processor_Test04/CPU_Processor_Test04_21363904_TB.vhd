----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 22.12.2022 13:29:14
-- Design Name: 
-- Module Name: CPU_Processor_Test04_21363904_TB - Sim
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

entity CPU_Processor_Test04_21363904_TB is
--  Port ( ); N/A
end CPU_Processor_Test04_21363904_TB;

architecture Sim of CPU_Processor_Test04_21363904_TB is

--Component

    component CPU_Processor_Test04_21363904
    port ( StatusVector : in STD_LOGIC_VECTOR (3 downto 0);
           Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Opcode : in STD_LOGIC_VECTOR (16 downto 0);
           FL : out STD_LOGIC;                    
           RZ : out STD_LOGIC;                    
           RN : out STD_LOGIC;                    
           RC : out STD_LOGIC;                    
           RV : out STD_LOGIC;                    
           MW : out STD_LOGIC;                    
           MM : out STD_LOGIC;                    
           RW : out STD_LOGIC;                    
           MD : out STD_LOGIC;                    
           FS : out STD_LOGIC_VECTOR (4 downto 0);
           MB : out STD_LOGIC;                    
           TB : out STD_LOGIC_VECTOR (3 downto 0);
           TA : out STD_LOGIC_VECTOR (3 downto 0);
           TD : out STD_LOGIC_VECTOR (3 downto 0);
           PL : out STD_LOGIC;                    
           PI : out STD_LOGIC;                    
           IL : out STD_LOGIC);                    
    end component;
    
--Signals

    signal opcode_TB : std_logic_vector (16 downto 0) := (others => '0');
    signal statvec_TB : std_logic_vector (3 downto 0) := (others => '0');
    signal clk_TB, reset_TB : std_logic := '0';
    
    signal fs_TB : std_logic_vector (4 downto 0) := (others => '0');
    signal ta_TB, tb_TB, td_TB : std_logic_vector (3 downto 0) := (others => '0');
    signal fl_TB, rz_TB, rn_TB, rc_TB, rv_TB, mw_TB, mm_TB : std_logic := '0';
    signal rw_TB, md_TB, mb_TB, pl_TB, pi_TB, il_TB : std_logic := '0';

begin

--Unit Under Test
    
    uut : CPU_Processor_Test04_21363904
    PORT MAP ( StatusVector => statvec_TB,
               Clock => clk_TB,
               Reset => reset_TB,
               Opcode => opcode_TB,
               FL => fl_TB,
               RZ => rz_TB,
               RN => rn_TB,
               RC => rc_TB,
               RV => rv_TB,
               MW => mw_TB,
               MM => mm_TB,
               RW => rw_TB,
               MD => md_TB,
               FS => fs_TB,
               MB => mb_TB,
               TB => tb_TB,
               TA => ta_TB,
               TD => td_TB,
               PL => pl_TB,
               PI => pi_TB,
               IL => il_TB);
               
    clk_TB <= not clk_TB after 180ns;
    
    stim_proc : process
    begin
    
        --Reset to Microoperation 1
        wait until clk_TB' event and clk_TB = '1';
        statvec_TB <= "0000";
        opcode_TB <= "00000000000000000";
        reset_TB <= '1';
        
        --Increment to Microoperation 2
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 3
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 4
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 5
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 6
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 7
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 8
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 9
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 10
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 11
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 12
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 13
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 14
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Increment to Microoperation 15
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
        
        --Use Next Address to return to Microoperation 1
        wait until clk_TB' event and clk_TB = '1';
        reset_TB <= '0';
      --load_TB <= '1';
        
    end process;

end Sim;
