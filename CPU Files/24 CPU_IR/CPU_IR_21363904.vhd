----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 07.12.2022 16:43:23
-- Design Name: 
-- Module Name: CPU_IR_21363904 - Behavioral
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

entity CPU_IR_21363904 is
  Port ( Clock : in STD_LOGIC;
         IL : in STD_LOGIC;
         Instruction : in STD_LOGIC_VECTOR (31 downto 0);
         DR : out STD_LOGIC_VECTOR (4 downto 0);
         Opcode : out STD_LOGIC_VECTOR (16 downto 0);
         SA : out STD_LOGIC_VECTOR (4 downto 0);
         SB : out STD_LOGIC_VECTOR (4 downto 0));
end CPU_IR_21363904;

architecture Behavioral of CPU_IR_21363904 is

begin

    process (Clock)
    begin
    
        if Clock' event and Clock = '1' then
            if IL = '1' then
                SB <= Instruction(4 downto 0) after 5ns;
                SA <= Instruction(9 downto 5) after 5ns;
                DR <= Instruction(14 downto 10) after 5ns;
                Opcode <= Instruction(31 downto 15) after 5ns;
            end if;
        end if;
    
    end process;

end Behavioral;
