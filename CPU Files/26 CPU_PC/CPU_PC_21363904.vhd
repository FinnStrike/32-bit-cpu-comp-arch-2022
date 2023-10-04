----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 07.12.2022 21:16:03
-- Design Name: 
-- Module Name: CPU_PC_21363904 - Behavioral
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

entity CPU_PC_21363904 is
  Port ( Clock : in STD_LOGIC;
         Displacement : in STD_LOGIC_VECTOR (31 downto 0);
         PI : in STD_LOGIC;
         PL : in STD_LOGIC;
         Reset : in STD_LOGIC;
         InstAdd : out STD_LOGIC_VECTOR (31 downto 0));
end CPU_PC_21363904;

architecture Behavioral of CPU_PC_21363904 is

--Components

    component CPU_Mux2_32Bit_21363904
    port ( Sel : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (31 downto 0);
           In1 : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    component DP_RippleCarryAdder32Bit_21363904
    port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C_IN : in STD_LOGIC;
           SUM : out STD_LOGIC_VECTOR (31 downto 0);
           C_OUT : out STD_LOGIC;
           V : out STD_LOGIC);
    end component;
    
    component RF_Register32Bit_21363904
    port( R32_D : in STD_LOGIC_VECTOR (31 downto 0);
          R32_Load : in STD_LOGIC;
          R32_CLK : in STD_LOGIC;
          R32_Q : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal mux_to_adder, adder_to_mux, mux_to_pc, pc_to_adder : std_logic_vector (31 downto 0) := (others => '0');
    signal pc_load : std_logic := '0';

begin

--PORT MAPS

    PL_PI_Mux : CPU_Mux2_32Bit_21363904
    PORT MAP ( Sel => PI,
               In0 => Displacement,
               In1 => X"00000001",
               Z => mux_to_adder);

    Adder : DP_RippleCarryAdder32Bit_21363904
    PORT MAP ( A => pc_to_adder,
               B => mux_to_adder,
               C_IN => '0',
               SUM => adder_to_mux);
               
    ResetMux : CPU_Mux2_32Bit_21363904
    PORT MAP ( Sel => Reset,
               In0 => adder_to_mux,
               In1 => X"00000003",
               Z => mux_to_pc);
               
    PC : RF_Register32Bit_21363904
    PORT MAP ( R32_D => mux_to_pc,
               R32_Load => pc_load,
               R32_CLK => Clock,
               R32_Q => pc_to_adder);
               
    InstAdd <= pc_to_adder after 5ns;
    pc_load <= (Reset OR PL) OR PI after 5ns;

end Behavioral;
