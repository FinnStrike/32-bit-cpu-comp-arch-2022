----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:43
-- Design Name: 
-- Module Name: DP_RippleCarryAdder32Bit_21363904 - Behavioral
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

entity DP_RippleCarryAdder32Bit_21363904 is
  Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
         B : in STD_LOGIC_VECTOR (31 downto 0);
         C_IN : in STD_LOGIC;
         SUM : out STD_LOGIC_VECTOR (31 downto 0);
         C_OUT : out STD_LOGIC;
         V : out STD_LOGIC);
end DP_RippleCarryAdder32Bit_21363904;

architecture Behavioral of DP_RippleCarryAdder32Bit_21363904 is

--Components

    component DP_FullAdder_21363904
    port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           SUM : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
    end component;

--Signals

    signal c0_to_c1, c1_to_c2, c2_to_c3, c3_to_c4, c4_to_c5, c5_to_c6, c6_to_c7, c7_to_c8 : std_logic; 
    signal c8_to_c9, c9_to_c10, c10_to_c11, c11_to_c12, c12_to_c13, c13_to_c14, c14_to_c15, c15_to_c16 : std_logic; 
    signal c16_to_c17, c17_to_c18, c18_to_c19, c19_to_c20, c20_to_c21, c21_to_c22, c22_to_c23, c23_to_c24 : std_logic;
    signal c24_to_c25, c25_to_c26, c26_to_c27, c27_to_c28, c28_to_c29, c29_to_c30, c30_to_c31, c31_to_c_out : std_logic;

begin

--PortMaps

    --Full Adders

    -- Instantiate Full Adder Bit 0
    BIT0: DP_FullAdder_21363904
    PORT MAP ( A => A(0),
               B => B(0),
               C_IN => C_IN,
               SUM => SUM(0),
               C_OUT => c0_to_c1);

    -- Instantiate Full Adder Bit 1
        BIT1: DP_FullAdder_21363904
        PORT MAP ( A => A(1),
                   B => B(1),
                   C_IN => c0_to_c1,
                   SUM => SUM(1),
                   C_OUT => c1_to_c2);
    
    -- Instantiate Full Adder Bit 2
        BIT2: DP_FullAdder_21363904
        PORT MAP ( A => A(2),
                   B => B(2),
                   C_IN => c1_to_c2,
                   SUM => SUM(2),
                   C_OUT => c2_to_c3);
    
    -- Instantiate Full Adder Bit 3
        BIT3: DP_FullAdder_21363904
        PORT MAP ( A => A(3),
                   B => B(3),
                   C_IN => c2_to_c3,
                   SUM => SUM(3),
                   C_OUT => c3_to_c4);
    
    -- Instantiate Full Adder Bit 4
        BIT4: DP_FullAdder_21363904
        PORT MAP ( A => A(4),
                   B => B(4),
                   C_IN => c3_to_c4,
                   SUM => SUM(4),
                   C_OUT => c4_to_c5);
    
    -- Instantiate Full Adder Bit 5
        BIT5: DP_FullAdder_21363904
        PORT MAP ( A => A(5),
                   B => B(5),
                   C_IN => c4_to_c5,
                   SUM => SUM(5),
                   C_OUT => c5_to_c6);
    
    -- Instantiate Full Adder Bit 6
        BIT6: DP_FullAdder_21363904
        PORT MAP ( A => A(6),
                   B => B(6),
                   C_IN => c5_to_c6,
                   SUM => SUM(6),
                   C_OUT => c6_to_c7);
    
    -- Instantiate Full Adder Bit 7
        BIT7: DP_FullAdder_21363904
        PORT MAP ( A => A(7),
                   B => B(7),
                   C_IN => c6_to_c7,
                   SUM => SUM(7),
                   C_OUT => c7_to_c8);
    
    -- Instantiate Full Adder Bit 8
        BIT8: DP_FullAdder_21363904
        PORT MAP ( A => A(8),
                   B => B(8),
                   C_IN => c7_to_c8,
                   SUM => SUM(8),
                   C_OUT => c8_to_c9);
    
    -- Instantiate Full Adder Bit 9
        BIT9: DP_FullAdder_21363904
        PORT MAP ( A => A(9),
                   B => B(9),
                   C_IN => c8_to_c9,
                   SUM => SUM(9),
                   C_OUT => c9_to_c10);
    
    -- Instantiate Full Adder Bit 10
        BIT10: DP_FullAdder_21363904
        PORT MAP ( A => A(10),
                   B => B(10),
                   C_IN => c9_to_c10,
                   SUM => SUM(10),
                   C_OUT => c10_to_c11);
    
    -- Instantiate Full Adder Bit 11
        BIT11: DP_FullAdder_21363904
        PORT MAP ( A => A(11),
                   B => B(11),
                   C_IN => c10_to_c11,
                   SUM => SUM(11),
                   C_OUT => c11_to_c12);
    
    -- Instantiate Full Adder Bit 12
        BIT12: DP_FullAdder_21363904
        PORT MAP ( A => A(12),
                   B => B(12),
                   C_IN => c11_to_c12,
                   SUM => SUM(12),
                   C_OUT => c12_to_c13);
    
    -- Instantiate Full Adder Bit 13
        BIT13: DP_FullAdder_21363904
        PORT MAP ( A => A(13),
                   B => B(13),
                   C_IN => c12_to_c13,
                   SUM => SUM(13),
                   C_OUT => c13_to_c14);
    
    -- Instantiate Full Adder Bit 14
        BIT14: DP_FullAdder_21363904
        PORT MAP ( A => A(14),
                   B => B(14),
                   C_IN => c13_to_c14,
                   SUM => SUM(14),
                   C_OUT => c14_to_c15);
    
    -- Instantiate Full Adder Bit 15
        BIT15: DP_FullAdder_21363904
        PORT MAP ( A => A(15),
                   B => B(15),
                   C_IN => c14_to_c15,
                   SUM => SUM(15),
                   C_OUT => c15_to_c16);
    
    -- Instantiate Full Adder Bit 16
        BIT16: DP_FullAdder_21363904
        PORT MAP ( A => A(16),
                   B => B(16),
                   C_IN => c15_to_c16,
                   SUM => SUM(16),
                   C_OUT => c16_to_c17);
    
    -- Instantiate Full Adder Bit 17
        BIT17: DP_FullAdder_21363904
        PORT MAP ( A => A(17),
                   B => B(17),
                   C_IN => c16_to_c17,
                   SUM => SUM(17),
                   C_OUT => c17_to_c18);
    
    -- Instantiate Full Adder Bit 18
        BIT18: DP_FullAdder_21363904
        PORT MAP ( A => A(18),
                   B => B(18),
                   C_IN => c17_to_c18,
                   SUM => SUM(18),
                   C_OUT => c18_to_c19);
    
    -- Instantiate Full Adder Bit 19
        BIT19: DP_FullAdder_21363904
        PORT MAP ( A => A(19),
                   B => B(19),
                   C_IN => c18_to_c19,
                   SUM => SUM(19),
                   C_OUT => c19_to_c20);
    
    -- Instantiate Full Adder Bit 20
        BIT20: DP_FullAdder_21363904
        PORT MAP ( A => A(20),
                   B => B(20),
                   C_IN => c19_to_c20,
                   SUM => SUM(20),
                   C_OUT => c20_to_c21);
    
    -- Instantiate Full Adder Bit 21
        BIT21: DP_FullAdder_21363904
        PORT MAP ( A => A(21),
                   B => B(21),
                   C_IN => c20_to_c21,
                   SUM => SUM(21),
                   C_OUT => c21_to_c22);
    
    -- Instantiate Full Adder Bit 22
        BIT22: DP_FullAdder_21363904
        PORT MAP ( A => A(22),
                   B => B(22),
                   C_IN => c21_to_c22,
                   SUM => SUM(22),
                   C_OUT => c22_to_c23);
    
    -- Instantiate Full Adder Bit 23
        BIT23: DP_FullAdder_21363904
        PORT MAP ( A => A(23),
                   B => B(23),
                   C_IN => c22_to_c23,
                   SUM => SUM(23),
                   C_OUT => c23_to_c24);
    
    -- Instantiate Full Adder Bit 24
        BIT24: DP_FullAdder_21363904
        PORT MAP ( A => A(24),
                   B => B(24),
                   C_IN => c23_to_c24,
                   SUM => SUM(24),
                   C_OUT => c24_to_c25);
    
    -- Instantiate Full Adder Bit 25
        BIT25: DP_FullAdder_21363904
        PORT MAP ( A => A(25),
                   B => B(25),
                   C_IN => c24_to_c25,
                   SUM => SUM(25),
                   C_OUT => c25_to_c26);
    
    -- Instantiate Full Adder Bit 26
        BIT26: DP_FullAdder_21363904
        PORT MAP ( A => A(26),
                   B => B(26),
                   C_IN => c25_to_c26,
                   SUM => SUM(26),
                   C_OUT => c26_to_c27);
    
    -- Instantiate Full Adder Bit 27
        BIT27: DP_FullAdder_21363904
        PORT MAP ( A => A(27),
                   B => B(27),
                   C_IN => c26_to_c27,
                   SUM => SUM(27),
                   C_OUT => c27_to_c28);
    
    -- Instantiate Full Adder Bit 28
        BIT28: DP_FullAdder_21363904
        PORT MAP ( A => A(28),
                   B => B(28),
                   C_IN => c27_to_c28,
                   SUM => SUM(28),
                   C_OUT => c28_to_c29);
    
    -- Instantiate Full Adder Bit 29
        BIT29: DP_FullAdder_21363904
        PORT MAP ( A => A(29),
                   B => B(29),
                   C_IN => c28_to_c29,
                   SUM => SUM(29),
                   C_OUT => c29_to_c30);
    
    -- Instantiate Full Adder Bit 30
        BIT30: DP_FullAdder_21363904
        PORT MAP ( A => A(30),
                   B => B(30),
                   C_IN => c29_to_c30,
                   SUM => SUM(30),
                   C_OUT => c30_to_c31);
    
    -- Instantiate Full Adder Bit 31
        BIT31: DP_FullAdder_21363904
        PORT MAP ( A => A(31),
                   B => B(31),
                   C_IN => c30_to_c31,
                   SUM => SUM(31),
                   C_OUT => c31_to_c_out);
                   
    -- Carry Out and Overflow
    
    C_OUT <= c31_to_c_out;
    
    V <= c31_to_c_Out XOR c30_to_c31 after 3ns;

end Behavioral;
