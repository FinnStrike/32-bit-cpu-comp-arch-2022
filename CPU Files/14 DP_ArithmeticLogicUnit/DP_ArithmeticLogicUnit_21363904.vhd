----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 01.11.2022 12:23:43
-- Design Name: 
-- Module Name: DP_ArithmeticLogicUnit_21363904 - Behavioral
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

entity DP_ArithmeticLogicUnit_21363904 is
  Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
         B : in STD_LOGIC_VECTOR (31 downto 0);
         C_IN : in STD_LOGIC;
         S0 : in STD_LOGIC;
         S1 : in STD_LOGIC;
         S2 : in STD_LOGIC;
         G : out STD_LOGIC_VECTOR (31 downto 0);
         C : out STD_LOGIC;
         V : out STD_LOGIC);
end DP_ArithmeticLogicUnit_21363904;

architecture Behavioral of DP_ArithmeticLogicUnit_21363904 is

--Components

    component DP_32Bit_B_Logic_21363904
    port ( B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component DP_32Bit_LogicCircuit_21363904
    port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component DP_RippleCarryAdder32Bit_21363904
    port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C_IN : in STD_LOGIC;
           SUM : out STD_LOGIC_VECTOR (31 downto 0);
           C_OUT : out STD_LOGIC;
           V : out STD_LOGIC);
    end component;
    
    component CPU_Mux2_32Bit_21363904
    port ( Sel : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (31 downto 0);
           In1 : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal blogic_to_adder, adder_to_mux, logic_to_mux : std_logic_vector (31 downto 0) := (others => '0');

begin

--Port Maps

    --B Logic Circuit
    BLogic : DP_32Bit_B_Logic_21363904
    PORT MAP ( B => B,
               S0 => S0,
               S1 => S1,
               Y => blogic_to_adder);
    
    --Ripple Carry Adder
    Adder : DP_RippleCarryAdder32Bit_21363904
    PORT MAP ( A => A,
               B => blogic_to_adder,
               C_IN => C_IN,
               SUM => adder_to_mux,
               C_OUT => C,
               V => V);
        
    --Logic Circuit
    LogicCircuit : DP_32Bit_LogicCircuit_21363904
    PORT MAP ( A => A,
               B => B,
               S0 => S0,
               S1 => S1,
               G => logic_to_mux);
    
    --ALU Multiplexer
    ALUMux : CPU_Mux2_32Bit_21363904
    PORT MAP ( Sel => S2,
               In0 => adder_to_mux,
               In1 => logic_to_mux,
               Z => G);
    
end Behavioral;
