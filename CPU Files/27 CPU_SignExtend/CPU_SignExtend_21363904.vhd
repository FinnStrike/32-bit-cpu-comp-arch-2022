----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 07.12.2022 20:36:39
-- Design Name: 
-- Module Name: CPU_SignExtend_21363904 - Behavioral
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

entity CPU_SignExtend_21363904 is
  Port ( Input : in STD_LOGIC_VECTOR (9 downto 0);
         Output : out STD_LOGIC_VECTOR (31 downto 0));
end CPU_SignExtend_21363904;

architecture Behavioral of CPU_SignExtend_21363904 is

begin
    
    process (Input)
    begin
    
        if Input(9) = '1' then
            Output(31 downto 10) <= "1111111111111111111111" after 5ns;
        else
            Output(31 downto 10) <= "0000000000000000000000" after 5ns;
        end if;
            
    end process;
    Output(9 downto 0) <= Input;
    
end Behavioral;
