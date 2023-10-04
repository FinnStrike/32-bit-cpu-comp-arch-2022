----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2022 17:04:14
-- Design Name: 
-- Module Name: DP_ArithmeticLogicUnit_21363904_TB - Sim
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

entity DP_ArithmeticLogicUnit_21363904_TB is
--  Port ( ); N/A
end DP_ArithmeticLogicUnit_21363904_TB;

architecture Sim of DP_ArithmeticLogicUnit_21363904_TB is

--Components

    component DP_ArithmeticLogicUnit_21363904
    port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C_IN : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (31 downto 0);
           C : out STD_LOGIC;
           V : out STD_LOGIC);
    end component;
    
--Signals

    signal a_TB, b_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal c_in_TB, s0_TB, s1_TB, s2_TB : std_logic;
    
    signal g_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal c_TB, v_TB : std_logic;

begin

--Unit Under Test

    uut : DP_ArithmeticLogicUnit_21363904
    PORT MAP ( A => a_TB,
               B => b_TB,
               C_IN => c_in_TB,
               S0 => s0_TB,
               S1 => s1_TB,
               S2 => s2_TB,
               G => g_TB,
               C => c_TB,
               V => v_TB);
    
    stim_proc : process
    begin
    
        -- F = A = Student ID = 0x0145FCC0 = 21363904
        wait for 20ns;
        a_TB <= "00000001010001011111110011000000";
        b_TB <= "11111110101110100000001100111111";
        s0_TB <= '0';
        s1_TB <= '0';
        s2_TB <= '0';
        c_in_TB <= '0';
        
        -- F = A + 1 = Student ID + 1 = 0x0145FCC1 = 21363905
        wait for 360ns;
        s0_TB <= '0';
        s1_TB <= '0';
        s2_TB <= '0';
        c_in_TB <= '1';
        
        -- F = A + B = Student ID + NOT(Student ID) = 0xFFFFFFFF = 4294967295 (All 1s)
        wait for 360ns;
        s0_TB <= '1';
        s1_TB <= '0';
        s2_TB <= '0';
        c_in_TB <= '0';
        
        -- F = A + B + 1 = Student ID + NOT(Student ID) + 1 = 0x00000000 + C (All 0s + Carry out)
        wait for 360ns;
        s0_TB <= '1';
        s1_TB <= '0';
        s2_TB <= '0';
        c_in_TB <= '1';
        
        -- F = A + NOT(B) = Student ID + Student ID = 0x028BF980 = 42727808
        wait for 360ns;
        s0_TB <= '0';
        s1_TB <= '1';
        s2_TB <= '0';
        c_in_TB <= '0';
        
        -- F = A + NOT(B) + 1 = Student ID + Student ID + 1 = 0x028BF981 = 42727809
        wait for 360ns;
        s0_TB <= '0';
        s1_TB <= '1';
        s2_TB <= '0';
        c_in_TB <= '1';
        
        -- F = A - 1 = Student ID - 1 = 0x0145FCBF = 21363903
        wait for 360ns;
        s0_TB <= '1';
        s1_TB <= '1';
        s2_TB <= '0';
        c_in_TB <= '0';
        
        -- F = A = Student ID = 0x0145FCC0 = 21363904
        wait for 360ns;
        s0_TB <= '1';
        s1_TB <= '1';
        s2_TB <= '0';
        c_in_TB <= '1';
        
        -- F = A AND B = Student ID & NOT(Student ID) = 0x00000000 = 0 (All 0s)
        wait for 360ns;
        s0_TB <= '0';
        s1_TB <= '0';
        s2_TB <= '1';
        c_in_TB <= '0';
        
        -- F = A OR B = Student ID | 0 = Student ID = 0x0145FCC0 = 21363904
        wait for 360ns;
        b_TB <= "00000000000000000000000000000000";
        s0_TB <= '1';
        s1_TB <= '0';
        s2_TB <= '1';
        c_in_TB <= '0';
        
        -- F = A XOR B = Student ID ^ NOT(Student ID) = 0xFFFFFFFF = 4294967295 (All 1s)
        wait for 360ns;
        b_TB <= "11111110101110100000001100111111";
        s0_TB <= '0';
        s1_TB <= '1';
        s2_TB <= '1';
        c_in_TB <= '0';
        
        -- F = NOT(A) = 0xFEBA033F = 4273603391
        wait for 360ns;
        s0_TB <= '1';
        s1_TB <= '1';
        s2_TB <= '1';
        c_in_TB <= '0';
        
        wait for 340ns;
    
    end process;

end Sim;
