----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.12.2022 20:46:33
-- Design Name: 
-- Module Name: CPU_ControlMemory_21363904_TB - Sim
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

entity CPU_ControlMemory_21363904_TB is
--  Port ( ); N/A
end CPU_ControlMemory_21363904_TB;

architecture Sim of CPU_ControlMemory_21363904_TB is

--Component

    component CPU_ControlMemory_21363904
      Port ( Address : in STD_LOGIC_VECTOR (16 downto 0);
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
             IL : out STD_LOGIC;                        
             MC : out STD_LOGIC;                        
             MS : out STD_LOGIC_VECTOR (2 downto 0);    
             NA : out STD_LOGIC_VECTOR (16 downto 0));  
    end component;
    
--Signals

    signal adr_TB : std_logic_vector (16 downto 0) := (others => '0');
    
    signal na_TB : std_logic_vector (16 downto 0) := (others => '0');
    signal fs_TB : std_logic_vector (4 downto 0) := (others => '0');
    signal ta_TB, tb_TB, td_TB : std_logic_vector (3 downto 0) := (others => '0');
    signal ms_TB : std_logic_vector (2 downto 0) := (others => '0');
    signal fl_TB, rz_TB, rn_TB, rc_TB, rv_TB, mw_TB, mm_TB : std_logic := '0';
    signal rw_TB, md_TB, mb_TB, pl_TB, pi_TB, il_TB, mc_TB : std_logic := '0';
    
begin

--Unit Under Test

    uut : CPU_ControlMemory_21363904
    PORT MAP ( Address => adr_TB,
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
               IL => il_TB,
               MC => mc_TB,
               MS => ms_TB,
               NA => na_TB);
    
    stim_proc : process
    begin
    
        wait for 20ns;
        adr_TB <= "0"&X"0000" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0001" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0002" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0003" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0004" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0005" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0006" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0007" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0008" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0009" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"000A" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"000B" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"000C" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"000D" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"000E" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"000F" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0010" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0011" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0012" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0013" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0014" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0015" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0016" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0017" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0018" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0019" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"001A" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"001B" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"001C" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"001D" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"001E" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"001F" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0020" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0021" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0022" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0023" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0024" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0025" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0026" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0027" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0028" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0029" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"002A" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"002B" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"002C" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"002D" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"002E" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"002F" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0030" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0031" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0032" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0033" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0034" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0035" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0036" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0037" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0038" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0039" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"003A" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"003B" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"003C" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"003D" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"003E" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"003F" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0040" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0041" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0042" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0043" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0044" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0045" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0046" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0047" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0048" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0049" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"004A" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"004B" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"004C" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"004D" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"004E" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"004F" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0050" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0051" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0052" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0053" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0054" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0055" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0056" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0057" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0058" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0059" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"005A" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"005B" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"005C" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"005D" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"005E" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"005F" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0060" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0061" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0062" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0063" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0064" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0065" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0066" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0067" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0068" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0069" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"006A" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"006B" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"006C" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"006D" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"006E" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"006F" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0070" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0071" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0072" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0073" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0074" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0075" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0076" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0077" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0078" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"0079" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"007A" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"007B" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"007C" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"007D" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"007E" after 5ns;

        wait for 20ns;
        adr_TB <= "0"&X"007F" after 5ns; 
    
    end process;

end Sim;
