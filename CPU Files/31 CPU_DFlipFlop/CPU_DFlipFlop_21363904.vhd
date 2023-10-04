----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 03.12.2022 16:43:55
-- Design Name: 
-- Module Name: CPU_DFlipFlop_21363904 - Behavioral
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

entity CPU_DFlipFlop_21363904 is
  Port ( Clock : in STD_LOGIC;
         D : in STD_LOGIC;
         Enable : in STD_LOGIC;
         Reset : in STD_LOGIC;
         Q : out STD_LOGIC);
end CPU_DFlipFlop_21363904;

architecture Behavioral of CPU_DFlipFlop_21363904 is

begin

    process (Clock)
    begin
        
        if Clock' event and Clock = '1' then
            if (Reset = '1') then
                Q <= '0' after 5ns;
            elsif (Enable = '1') then
                Q <= D after 5ns;
            end if;
        end if;
        
    end process;

end Behavioral;
