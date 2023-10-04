----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 10/18/2022 06:26:18 PM
-- Design Name: 
-- Module Name: RF_Register32Bit_21363904 - Behavioral
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

entity RF_Register32Bit_21363904 is
  Port ( R32_D : in STD_LOGIC_VECTOR (31 downto 0);
         R32_Load : in STD_LOGIC;
         R32_CLK : in STD_LOGIC;
         R32_Q : out STD_LOGIC_VECTOR (31 downto 0));
end RF_Register32Bit_21363904;

architecture Behavioral of RF_Register32Bit_21363904 is

begin

process (R32_CLK)
begin
   if R32_CLK'event and R32_CLK='1' then
     if R32_Load='1' then
       R32_Q <= R32_D after 3ns;
     end if;
   end if;
end process;

end Behavioral;
