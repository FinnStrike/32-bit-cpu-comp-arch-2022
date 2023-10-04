----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 28.11.2022 13:36:34
-- Design Name: 
-- Module Name: CPU_RAM_21363904_TB - Sim
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU_RAM_21363904_TB is
--  Port ( ); N/A
end CPU_RAM_21363904_TB;

architecture Sim of CPU_RAM_21363904_TB is

--Components

    component CPU_RAM_21363904
    port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           Clock : in STD_LOGIC;
           DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           WriteEnable : in STD_LOGIC;
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal adr_TB, in_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal clk_TB, rw_TB : std_logic := '0';
    
    signal out_TB : std_logic_vector (31 downto 0) := (others => '0');

begin

--Unit Under Test

    uut : CPU_RAM_21363904
    PORT MAP ( Address => adr_TB,
               Clock => clk_TB,
               DataIn => in_TB,
               WriteEnable => rw_TB,
               DataOut => out_TB);
               
    clk_TB <= not clk_TB  after 5ns;
               
    stim_proc : process
    begin
    
--Load RAM

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000000" after 5ns;
        in_TB <= X"00000000" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000001" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000002" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000003" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000004" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000005" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000006" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000007" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000008" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000009" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000010" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000011" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000012" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000013" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000014" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000015" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000016" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000017" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000018" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000019" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000020" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000021" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000022" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000023" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000024" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000025" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000026" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000027" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000028" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000029" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000002A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000002B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000002C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000002D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000002E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000002F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000030" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000031" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000032" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000033" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000034" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000035" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000036" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000037" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000038" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000039" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000003A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000003B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000003C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000003D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000003E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000003F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000040" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000041" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000042" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000043" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000044" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000045" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000046" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000047" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000048" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000049" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000004A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000004B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000004C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000004D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000004E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000004F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000050" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000051" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000052" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000053" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000054" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000055" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000056" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000057" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000058" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000059" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000005A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000005B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000005C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000005D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000005E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000005F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000060" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000061" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000062" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000063" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000064" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000065" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000066" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000067" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000068" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000069" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000006A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000006B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000006C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000006D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000006E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000006F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000070" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000071" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000072" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000073" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000074" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000075" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000076" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000077" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000078" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000079" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000007A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000007B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000007C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000007D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000007E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000007F" after 5ns;        
        
--Overwrite

        wait until clk_TB' event and clk_TB = '1';
        rw_TB <= '1' after 5ns;
        adr_TB <= X"00000004" after 5ns;
        in_TB <= X"FFFFFF04" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000005" after 5ns;
        in_TB <= X"FFFFFF05" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000006" after 5ns;
        in_TB <= X"FFFFFF06" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000007" after 5ns;
        in_TB <= X"FFFFFF07" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000008" after 5ns;
        in_TB <= X"FFFFFF08" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000009" after 5ns;
        in_TB <= X"FFFFFF09" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000A" after 5ns;
        in_TB <= X"FFFFFF0A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000B" after 5ns;
        in_TB <= X"FFFFFF0B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000C" after 5ns;
        in_TB <= X"FFFFFF0C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000D" after 5ns;
        in_TB <= X"FFFFFF0D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000E" after 5ns;
        in_TB <= X"FFFFFF0E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000000F" after 5ns;
        in_TB <= X"FFFFFF0F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000010" after 5ns;
        in_TB <= X"FFFFFF10" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000011" after 5ns;
        in_TB <= X"FFFFFF11" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000012" after 5ns;
        in_TB <= X"FFFFFF12" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000013" after 5ns;
        in_TB <= X"FFFFFF13" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000014" after 5ns;
        in_TB <= X"FFFFFF14" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000015" after 5ns;
        in_TB <= X"FFFFFF15" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000016" after 5ns;
        in_TB <= X"FFFFFF16" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000017" after 5ns;
        in_TB <= X"FFFFFF17" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000018" after 5ns;
        in_TB <= X"FFFFFF18" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000019" after 5ns;
        in_TB <= X"FFFFFF19" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001A" after 5ns;
        in_TB <= X"FFFFFF1A" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001B" after 5ns;
        in_TB <= X"FFFFFF1B" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001C" after 5ns;
        in_TB <= X"FFFFFF1C" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001D" after 5ns;
        in_TB <= X"FFFFFF1D" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001E" after 5ns;
        in_TB <= X"FFFFFF1E" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"0000001F" after 5ns;
        in_TB <= X"FFFFFF1F" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000020" after 5ns;
        in_TB <= X"FFFFFF20" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000021" after 5ns;
        in_TB <= X"FFFFFF21" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000022" after 5ns;
        in_TB <= X"FFFFFF22" after 5ns;

        wait until clk_TB' event and clk_TB = '1';
        adr_TB <= X"00000023" after 5ns;
        in_TB <= X"FFFFFF23" after 5ns;
    
--Failed Overwrite

        wait until clk_TB' event and clk_TB = '1';
        rw_TB <= '0' after 5ns;
        adr_TB <= X"00000000" after 5ns;
        in_TB <= X"FFFFFFFF" after 5ns;
    
    end process;

end Sim;
