----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 30.11.2022 13:39:04
-- Design Name: 
-- Module Name: CPU_Processor_Test01_21363904 - Behavioral
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

entity CPU_Processor_Test01_21363904 is
  Port ( MW : in STD_LOGIC;
         InstAddress : in STD_LOGIC_VECTOR (31 downto 0);
         MM : in STD_LOGIC;
         Clock : in STD_LOGIC;
         DR : in STD_LOGIC_VECTOR (4 downto 0);
         FS : in STD_LOGIC_VECTOR (4 downto 0);
         IR_IN : in STD_LOGIC_VECTOR (31 downto 0);
         MB : in STD_LOGIC;
         MD : in STD_LOGIC;
         RW : in STD_LOGIC;
         SA : in STD_LOGIC_VECTOR (4 downto 0);
         SB : in STD_LOGIC_VECTOR (4 downto 0);
         TA : in STD_LOGIC_VECTOR (3 downto 0);
         TB : in STD_LOGIC_VECTOR (3 downto 0);
         TD : in STD_LOGIC_VECTOR (3 downto 0);
         C : out STD_LOGIC;
         N : out STD_LOGIC;
         V : out STD_LOGIC;
         Z : out STD_LOGIC);
end CPU_Processor_Test01_21363904;

architecture Behavioral of CPU_Processor_Test01_21363904 is

--Components

    component DP_Datapath_21363904
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
    end component;
    
    component CPU_RAM_21363904
    Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           Clock : in STD_LOGIC;
           DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           WriteEnable : in STD_LOGIC;
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component CPU_Mux2_32Bit_21363904
      Port ( Sel : in STD_LOGIC;
             In0 : in STD_LOGIC_VECTOR (31 downto 0);
             In1 : in STD_LOGIC_VECTOR (31 downto 0);
             Z : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal mux_to_ram, ram_to_dp, dp_to_mux, dp_to_ram : std_logic_vector (31 downto 0) := (others => '0');

begin

--Port Maps

    --Datapath
    Datapath : DP_Datapath_21363904
    PORT MAP ( IR_IN => IR_IN,
               MB => MB,
               DATA_IN => ram_to_dp,
               MD => MD,
               FS => FS,
               Clock => Clock,
               DR => DR,
               RW => RW,
               SA => SA,
               SB => SB,
               TA => TA,
               TB => TB,
               TD => TD,
               DATA_OUT => dp_to_ram,
               N => N,
               C => C,
               Z => Z,
               V => V,
               ADD => dp_to_mux);
    
    --RAM
    RAM : CPU_RAM_21363904
    PORT MAP ( Address => mux_to_ram,
               Clock => Clock,
               DataIn => dp_to_ram,
               WriteEnable => MW,
               DataOut => ram_to_dp);
    
    --MuxM
    MuxM : CPU_Mux2_32Bit_21363904
    PORT MAP ( Sel => MM,
               In0 => dp_to_mux,
               In1 => InstAddress,
               Z => mux_to_ram);

end Behavioral;
