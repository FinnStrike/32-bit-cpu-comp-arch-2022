----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 10.11.2022 13:44:11
-- Design Name: 
-- Module Name: DP_Datapath_21363904 - Behavioral
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

entity DP_Datapath_21363904 is
  Port ( IR_IN : in STD_LOGIC_VECTOR (31 downto 0);
         MB : in STD_LOGIC;
         DATA_IN : in STD_LOGIC_VECTOR (31 downto 0);
         MD : in STD_LOGIC;
         FS : in STD_LOGIC_VECTOR (4 downto 0);
         Clock : in STD_LOGIC;
         DR : in STD_LOGIC_VECTOR (4 downto 0);
         RW : in STD_LOGIC;
         SA : in STD_LOGIC_VECTOR (4 downto 0);
         SB : in STD_LOGIC_VECTOR (4 downto 0);
         TA : in STD_LOGIC_VECTOR (3 downto 0);
         TB : in STD_LOGIC_VECTOR (3 downto 0);
         TD : in STD_LOGIC_VECTOR (3 downto 0);
         DATA_OUT : out STD_LOGIC_VECTOR (31 downto 0);
         N : out STD_LOGIC;
         C : out STD_LOGIC;
         Z : out STD_LOGIC;
         V : out STD_LOGIC;
         ADD : out STD_LOGIC_VECTOR (31 downto 0));
end DP_Datapath_21363904;

architecture Behavioral of DP_Datapath_21363904 is

--Components

    component RF_RegisterFile_32_15_21363904
    port ( SA : in STD_LOGIC_VECTOR (4 downto 0);
           SB : in STD_LOGIC_VECTOR (4 downto 0);
           DR : in STD_LOGIC_VECTOR (4 downto 0);
           RW : in STD_LOGIC;
           Clock : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (31 downto 0);
           TA : in STD_LOGIC_VECTOR (3 downto 0);
           TB : in STD_LOGIC_VECTOR (3 downto 0);
           TD : in STD_LOGIC_VECTOR (3 downto 0);
           A : out STD_LOGIC_VECTOR (31 downto 0);
           B : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
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
    
    component CPU_Mux2_32Bit_21363904
    port ( Sel : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (31 downto 0);
           In1 : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal reg_to_func, reg_to_mux, func_to_mux : std_logic_vector (31 downto 0) := (others => '0');
    signal mux_to_reg, mux_to_func : std_logic_vector (31 downto 0) := (others => '0');

begin

--Port Maps

    --Register File
    RegFile : RF_RegisterFile_32_15_21363904
    PORT MAP ( SA => SA,
               SB => SB,
               DR => DR,
               RW => RW,
               Clock => Clock,
               D => mux_to_reg,
               TA => TA,
               TB => TB,
               TD => TD,
               A => reg_to_func,
               B => reg_to_mux);
    ADD <= reg_to_func;
    
    --Functional Unit
    FunctionalUnit : DP_FunctionalUnit_21363904
    PORT MAP ( A => reg_to_func,
               B => mux_to_func,
               FS => FS,
               F => func_to_mux,
               N => N,
               C => C,
               Z => Z,
               V => V);
    
    --Multiplexer B
    MuxB : CPU_Mux2_32Bit_21363904
    PORT MAP ( Sel => MB,
               In0 => reg_to_mux,
               In1 => IR_IN,
               Z => mux_to_func);
    DATA_OUT <= mux_to_func;
    
    --Multiplexer D
    MuxD : CPU_Mux2_32Bit_21363904
    PORT MAP ( Sel => MD,
               In0 => func_to_mux,
               In1 => DATA_IN,
               Z => mux_to_reg);

end Behavioral;
