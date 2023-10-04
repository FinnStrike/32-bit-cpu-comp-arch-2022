----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 10.11.2022 12:52:00
-- Design Name: 
-- Module Name: DP_FunctionalUnit_21363904_TB - Sim
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

entity DP_FunctionalUnit_21363904_TB is
--  Port ( ); N/A
end DP_FunctionalUnit_21363904_TB;

architecture Sim of DP_FunctionalUnit_21363904_TB is

--Components

    component DP_FunctionalUnit_21363904
    port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           F : out STD_LOGIC_VECTOR (31 downto 0);
           N : out STD_LOGIC;
           C : out STD_LOGIC;
           Z : out STD_LOGIC;
           V : out STD_LOGIC);
    end component;
    
--Signals

    signal a_TB, b_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal fs_TB : std_logic_vector (4 downto 0) := (others => '0');
    
    signal f_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal n_TB, c_TB, z_TB, v_TB : std_logic;

begin

--Unit Under Test

    uut : DP_FunctionalUnit_21363904
    PORT MAP ( A => a_TB,
               B => b_TB,
               FS => fs_TB,
               F => f_TB,
               N => n_TB,
               C => c_TB,
               Z => z_TB,
               V => v_TB);
    
    stim_proc : process
    begin
    
        wait for 20ns;
        a_TB <= "00000001010001011111110011000000"; --Student ID = 0145FCC0
        b_TB <= "00000001010001011111110011000100"; --Student ID + 4 = 0145FCC4
        fs_TB <= "00000";
        
        -- F = A + NOT(B) + 1 = 0145FCC0 + FEBA033B + 1 = FFFFFFFC
        wait for 360ns;
        fs_TB <= "00101";
        
        -- F = NOT(A) = NOT(0145FCC0) = FEBA033F
        wait for 360ns;
        fs_TB <= "01110";
        
        -- F = A + NOT(B) = 0145FCC0 + FEBA033B = FFFFFFFB
        wait for 360ns;
        fs_TB <= "00100";
        
        -- F = A = 0145FCC0 [FS = 00111]
        wait for 360ns;
        fs_TB <= "00111";
        
        -- F = A + B + 1 = 0145FCC0 + 0145FCC4 + 1 = 028BF985
        wait for 360ns;
        fs_TB <= "00011";
        
        -- F = B>> = LSR(0145FCC4) = 00A2FE62
        wait for 360ns;
        fs_TB <= "10100";
        
        -- F = A + B = 0145FCC0 + 0145FCC4 = 028BF984
        wait for 360ns;
        fs_TB <= "00010";
        
        -- F = B<< = LSL(0145FCC4) = 028BF988
        wait for 360ns;
        fs_TB <= "11000";
        
        -- F = A = 0145FCC0 [FS = 00000]
        wait for 360ns;
        fs_TB <= "00000";
        
        -- F = B = 0145FCC4
        wait for 360ns;
        fs_TB <= "10000";
        
        -- F = A + 1 = 0145FCC0 + 1 = 0145FCC1
        wait for 360ns;
        fs_TB <= "00001";
        
        -- F = A XOR B = 0145FCC0 XOR 0145FCC4 = 00000004
        wait for 360ns;
        fs_TB <= "01100";
        
        -- F = A OR B = 0145FCC0 OR 0145FCC4 = 0145FCC4
        wait for 360ns;
        fs_TB <= "01010";
        
        -- F = A - 1 = 0145FCC0 - 1 = 0145FCBF
        wait for 360ns;
        fs_TB <= "00110";
        
        -- F = A AND B = 0145FCC0 AND 0145FCC4 = 0145FCC0
        wait for 360ns;
        fs_TB <= "01000";
            
        wait for 340ns;
            
    end process;

end Sim;
