----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 07.12.2022 19:33:15
-- Design Name: 
-- Module Name: CPU_ZeroFill_21363904 - Behavioral
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

entity CPU_ZeroFill_21363904 is
  Port ( SB : in STD_LOGIC_VECTOR (4 downto 0);
        MuxB : out STD_LOGIC_VECTOR (31 downto 0));
end CPU_ZeroFill_21363904;

architecture Behavioral of CPU_ZeroFill_21363904 is

begin

    MuxB(4 downto 0) <= SB(4 downto 0) after 5ns;
    MuxB(31 downto 5) <= "000000000000000000000000000" after 5ns;

end Behavioral;
