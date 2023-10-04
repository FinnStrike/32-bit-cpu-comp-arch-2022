----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 03.12.2022 21:17:26
-- Design Name: 
-- Module Name: CPU_StatusRegister_21363904 - Behavioral
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

entity CPU_StatusRegister_21363904 is
  Port ( Clock : in STD_LOGIC;
         LoadFlags : in STD_LOGIC;
         C_Flag : in STD_LOGIC;
         Reset_C : in STD_LOGIC;
         N_Flag : in STD_LOGIC;
         Reset_N : in STD_LOGIC;
         V_Flag : in STD_LOGIC;
         Reset_V : in STD_LOGIC;
         Z_Flag : in STD_LOGIC;
         Reset_Z : in STD_LOGIC;
         StatusVector : out STD_LOGIC_VECTOR (3 downto 0));
end CPU_StatusRegister_21363904;

architecture Behavioral of CPU_StatusRegister_21363904 is

--Components

    component CPU_DFlipFlop_21363904
    Port ( Clock : in STD_LOGIC;
           D : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC);
    end component;

begin

--Port Maps

    CFlag : CPU_DFlipFlop_21363904
    PORT MAP ( Clock => Clock,
               D => C_Flag,
               Enable => LoadFlags,
               Reset => Reset_C,
               Q => StatusVector(0));
               
    NFlag : CPU_DFlipFlop_21363904
    PORT MAP ( Clock => Clock,
               D => N_Flag,
               Enable => LoadFlags,
               Reset => Reset_N,
               Q => StatusVector(2));
             
    VFlag : CPU_DFlipFlop_21363904
    PORT MAP ( Clock => Clock,
               D => V_Flag,
               Enable => LoadFlags,
               Reset => Reset_V,
               Q => StatusVector(1));
               
    ZFlag : CPU_DFlipFlop_21363904
    PORT MAP ( Clock => Clock,
               D => Z_Flag,
               Enable => LoadFlags,
               Reset => Reset_Z,
               Q => StatusVector(3));

end Behavioral;
