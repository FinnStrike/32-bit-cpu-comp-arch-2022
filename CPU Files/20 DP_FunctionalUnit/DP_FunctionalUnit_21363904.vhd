----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:44
-- Design Name: 
-- Module Name: DP_FunctionalUnit_21363904 - Behavioral
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

entity DP_FunctionalUnit_21363904 is
  Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
         B : in STD_LOGIC_VECTOR (31 downto 0);
         FS : in STD_LOGIC_VECTOR (4 downto 0);
         F : out STD_LOGIC_VECTOR (31 downto 0);
         N : out STD_LOGIC;
         C : out STD_LOGIC;
         Z : out STD_LOGIC;
         V : out STD_LOGIC);
end DP_FunctionalUnit_21363904;

architecture Behavioral of DP_FunctionalUnit_21363904 is

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
    
    component DP_Shifter_21363904
    port ( B : in STD_LOGIC_VECTOR (31 downto 0);
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (31 downto 0);
           C : out STD_LOGIC);
    end component;
    
    component CPU_Mux2_32Bit_21363904
    port ( Sel : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (31 downto 0);
           In1 : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component DP_CFlagMux2_1Bit_21363904
    port ( FS4 : in STD_LOGIC;
           C_ALU : in STD_LOGIC;
           C_Shift : in STD_LOGIC;
           C : out STD_LOGIC);
    end component;
    
    component DP_ZeroDetection_21363904
    port ( F : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC);
    end component;
    
--Signals

    signal alu_to_mux, shift_to_mux, mux_to_f : std_logic_vector (31 downto 0) := (others => '0');
    signal alu_to_c, shift_to_c : std_logic;

begin

--Port Maps

    --Arithmetic Logic Unit
    ALU : DP_ArithmeticLogicUnit_21363904
    PORT MAP ( A => A,
               B => B,
               C_IN => FS(0),
               S0 => FS(1),
               S1 => FS(2),
               S2 => FS(3),
               G => alu_to_mux,
               C => alu_to_c,
               V => V);
    
    --Shifter
    Shifter : DP_Shifter_21363904
    PORT MAP ( B => B,
               S1 => FS(2),
               S2 => FS(3),
               G => shift_to_mux,
               C => shift_to_c);
    
    --Multiplexer F
    MuxF : CPU_Mux2_32Bit_21363904
    PORT MAP ( Sel => FS(4),
               In0 => alu_to_mux,
               In1 => shift_to_mux,
               Z => mux_to_f);
    F <= mux_to_f;
    N <= mux_to_f(31);
    
    --C Flag
    C_Flag : DP_CFlagMux2_1Bit_21363904
    PORT MAP ( FS4 => FS(4),
               C_ALU => alu_to_c,
               C_SHIFT => shift_to_c,
               C => C);    
    
    --Z Flag
    Z_Flag : DP_ZeroDetection_21363904
    PORT MAP ( F => mux_to_f,
               Z => Z);

end Behavioral;
