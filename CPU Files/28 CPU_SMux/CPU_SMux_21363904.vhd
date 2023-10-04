----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.12.2022 15:58:33
-- Design Name: 
-- Module Name: CPU_SMux_21363904 - Behavioral
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

entity CPU_SMux_21363904 is
  Port ( C_Flag : in STD_LOGIC;
         MS : in STD_LOGIC_VECTOR (2 downto 0);
         N_Flag : in STD_LOGIC;
         Not_C_Flag : in STD_LOGIC;
         Not_Z_Flag : in STD_LOGIC;
         One : in STD_LOGIC;
         V_Flag : in STD_LOGIC;
         Z_Flag : in STD_LOGIC;
         Zero : in STD_LOGIC;
         CAR : out STD_LOGIC);
end CPU_SMux_21363904;

architecture Behavioral of CPU_SMux_21363904 is

begin

    CAR <= Zero after 5ns when MS = "000" else
           One after 5ns when MS = "001" else
           C_Flag after 5ns when MS = "010" else
           V_Flag after 5ns when MS = "011" else
           Z_Flag after 5ns when MS = "100" else
           N_Flag after 5ns when MS = "101" else
           Not_C_Flag after 5ns when MS = "110" else
           Not_Z_Flag after 5ns when MS = "111";

end Behavioral;
