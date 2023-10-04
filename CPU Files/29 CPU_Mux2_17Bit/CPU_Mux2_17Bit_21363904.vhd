----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.12.2022 15:30:38
-- Design Name: 
-- Module Name: CPU_Mux2_17Bit_21363904 - Behavioral
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

entity CPU_Mux2_17Bit_21363904 is
    Port ( Sel : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (16 downto 0);
           In1 : in STD_LOGIC_VECTOR (16 downto 0);
           Z : out STD_LOGIC_VECTOR (16 downto 0));
end CPU_Mux2_17Bit_21363904;

architecture Behavioral of CPU_Mux2_17Bit_21363904 is

begin

    Z <= In0 after 5ns when Sel = '0' else
         In1 after 5ns when Sel = '1';

end Behavioral;
