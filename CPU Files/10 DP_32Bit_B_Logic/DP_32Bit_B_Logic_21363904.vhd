----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:44
-- Design Name: 
-- Module Name: DP_32Bit_B_Logic_21363904 - Behavioral
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

entity DP_32Bit_B_Logic_21363904 is
  Port ( B : in STD_LOGIC_VECTOR (31 downto 0);
         S0 : in STD_LOGIC;
         S1 : in STD_LOGIC;
         Y : out STD_LOGIC_VECTOR (31 downto 0));
end DP_32Bit_B_Logic_21363904;

architecture Behavioral of DP_32Bit_B_Logic_21363904 is

--Components

    component DP_SingleBit_B_Logic_21363904
    port ( B : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Y : out STD_LOGIC);
    end component;

begin

--Port Maps

    --SingleBit B Logics
    
    BIT00 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(0),
               S0 => S0,
               S1 => S1,
               Y => Y(0));

    BIT01 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(1),
               S0 => S0,
               S1 => S1,
               Y => Y(1));

    BIT02 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(2),
               S0 => S0,
               S1 => S1,
               Y => Y(2));

    BIT03 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(3),
               S0 => S0,
               S1 => S1,
               Y => Y(3));

    BIT04 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(4),
               S0 => S0,
               S1 => S1,
               Y => Y(4));

    BIT05 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(5),
               S0 => S0,
               S1 => S1,
               Y => Y(5));

    BIT06 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(6),
               S0 => S0,
               S1 => S1,
               Y => Y(6));

    BIT07 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(7),
               S0 => S0,
               S1 => S1,
               Y => Y(7));

    BIT08 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(8),
               S0 => S0,
               S1 => S1,
               Y => Y(8));

    BIT09 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(9),
               S0 => S0,
               S1 => S1,
               Y => Y(9));

    BIT10 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(10),
               S0 => S0,
               S1 => S1,
               Y => Y(10));

    BIT11 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(11),
               S0 => S0,
               S1 => S1,
               Y => Y(11));

    BIT12 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(12),
               S0 => S0,
               S1 => S1,
               Y => Y(12));

    BIT13 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(13),
               S0 => S0,
               S1 => S1,
               Y => Y(13));

    BIT14 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(14),
               S0 => S0,
               S1 => S1,
               Y => Y(14));

    BIT15 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(15),
               S0 => S0,
               S1 => S1,
               Y => Y(15));

    BIT16 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(16),
               S0 => S0,
               S1 => S1,
               Y => Y(16));

    BIT17 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(17),
               S0 => S0,
               S1 => S1,
               Y => Y(17));

    BIT18 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(18),
               S0 => S0,
               S1 => S1,
               Y => Y(18));

    BIT19 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(19),
               S0 => S0,
               S1 => S1,
               Y => Y(19));

    BIT20 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(20),
               S0 => S0,
               S1 => S1,
               Y => Y(20));

    BIT21 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(21),
               S0 => S0,
               S1 => S1,
               Y => Y(21));

    BIT22 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(22),
               S0 => S0,
               S1 => S1,
               Y => Y(22));

    BIT23 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(23),
               S0 => S0,
               S1 => S1,
               Y => Y(23));

    BIT24 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(24),
               S0 => S0,
               S1 => S1,
               Y => Y(24));

    BIT25 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(25),
               S0 => S0,
               S1 => S1,
               Y => Y(25));

    BIT26 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(26),
               S0 => S0,
               S1 => S1,
               Y => Y(26));

    BIT27 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(27),
               S0 => S0,
               S1 => S1,
               Y => Y(27));

    BIT28 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(28),
               S0 => S0,
               S1 => S1,
               Y => Y(28));

    BIT29 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(29),
               S0 => S0,
               S1 => S1,
               Y => Y(29));

    BIT30 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(30),
               S0 => S0,
               S1 => S1,
               Y => Y(30));

    BIT31 : DP_SingleBit_B_Logic_21363904
    PORT MAP ( B => B(31),
               S0 => S0,
               S1 => S1,
               Y => Y(31));

end Behavioral;
