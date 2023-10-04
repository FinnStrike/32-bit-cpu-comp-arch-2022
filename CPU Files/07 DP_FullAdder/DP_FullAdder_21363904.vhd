----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:43
-- Design Name: 
-- Module Name: DP_FullAdder_21363904 - Behavioral
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

entity DP_FullAdder_21363904 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           SUM : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end DP_FullAdder_21363904;

architecture Behavioral of DP_FullAdder_21363904 is

    signal s_xor1_to_xor2, s_and1_or, s_and2_or : STD_LOGIC;

begin

    s_xor1_to_xor2 <= A XOR B after 4ns;
    s_and1_or <= A AND B after 3ns;
    s_and2_or <= s_xor1_to_xor2 AND C_IN after 3ns;

    SUM <= s_xor1_to_xor2 XOR C_IN after 4ns;
    C_OUT <= s_and1_or OR s_and2_or after 2ns;

end Behavioral;
