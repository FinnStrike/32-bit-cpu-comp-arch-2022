----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.12.2022 16:57:01
-- Design Name: 
-- Module Name: CPU_CAR_21363904 - Behavioral
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

entity CPU_CAR_21363904 is
  Port ( Address : in STD_LOGIC_VECTOR (16 downto 0);
         Clock : in STD_LOGIC;
         LoadAdd : in STD_LOGIC;
         Reset : in STD_LOGIC;
         CMAdd : out STD_LOGIC_VECTOR (16 downto 0));
end CPU_CAR_21363904;

architecture Behavioral of CPU_CAR_21363904 is

    signal adr : std_logic_vector (16 downto 0) := (others => '0');

begin

    process (Clock)
    begin
        
        if Clock' event and Clock = '1' then
            if (Reset = '1') then
                adr <= "00000000000000100" after 3ns;
            elsif (LoadAdd = '1') then
                adr <= Address after 3ns;
            else
                adr <= std_logic_vector(unsigned(adr) + 1 ) after 3ns;
            end if;
        end if;
    
    end process;
    
    CMAdd <= adr after 2ns;

end Behavioral;
