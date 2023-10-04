----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 08.11.2022 15:42:41
-- Design Name: 
-- Module Name: DP_32Bit_LogicCircuit_21363904_TB - Sim
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

entity DP_32Bit_LogicCircuit_21363904_TB is
--  Port ( ); N/A
end DP_32Bit_LogicCircuit_21363904_TB;

architecture Sim of DP_32Bit_LogicCircuit_21363904_TB is

--Components

    component DP_32Bit_LogicCircuit_21363904
    port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal a_TB, b_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal s0_TB, s1_TB : std_logic;
    
    signal g_TB : std_logic_vector (31 downto 0) := (others => '0');

begin

--Unit Under Test

    uut : DP_32Bit_LogicCircuit_21363904
    PORT MAP ( A => a_TB,
               B => b_TB,
               S0 => s0_TB,
               S1 => s1_TB,
               G => g_TB);
    
    stim_proc : process
    begin
        
        -- Student ID AND NOT(Student ID) = 00000000
        wait for 20ns;
        a_TB <= X"0145FCC0";
        b_TB <= X"FEBA033F";
        s0_TB <= '0';
        s1_TB <= '0';
        
        -- Student ID OR 00000001 = Student ID + 1
        wait for 20ns;
        b_TB <= X"00000001";
        s0_TB <= '1';
        s1_TB <= '0';
        
        -- Student ID XOR NOT(Student ID) = FFFFFFFF
        wait for 20ns;
        b_TB <= X"FEBA033F";
        s0_TB <= '0';
        s1_TB <= '1';
        
        -- NOT(Student ID) = FEBA033F
        wait for 20ns;
        b_TB <= X"FEBA033F";
        s0_TB <= '1';
        s1_TB <= '1';
    
    end process;

end Sim;
