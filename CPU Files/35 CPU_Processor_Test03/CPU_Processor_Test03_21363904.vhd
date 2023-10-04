----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 19.12.2022 18:52:47
-- Design Name: 
-- Module Name: CPU_Processor_Test03_21363904 - Behavioral
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

entity CPU_Processor_Test03_21363904 is
  Port ( MM : in STD_LOGIC;
         MW : in STD_LOGIC;
         FS : in STD_LOGIC_VECTOR (4 downto 0);
         MB : in STD_LOGIC;
         MD : in STD_LOGIC;
         RW : in STD_LOGIC;
         TA : in STD_LOGIC_VECTOR (3 downto 0);
         TB : in STD_LOGIC_VECTOR (3 downto 0);
         IL : in STD_LOGIC;
         TD : in STD_LOGIC_VECTOR (3 downto 0);
         Clock : in STD_LOGIC;
         LoadFlags : in STD_LOGIC;
         PI : in STD_LOGIC;
         PL : in STD_LOGIC;
         Reset : in STD_LOGIC;
         Reset_C : in STD_LOGIC;
         Reset_N : in STD_LOGIC;
         Reset_V : in STD_LOGIC;
         Reset_Z : in STD_LOGIC;
         Opcode : out STD_LOGIC_VECTOR (16 downto 0);
         StatusVector : out STD_LOGIC_VECTOR (3 downto 0));
end CPU_Processor_Test03_21363904;

architecture Behavioral of CPU_Processor_Test03_21363904 is

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
    
    component CPU_StatusRegister_21363904
      Port ( Clock : in STD_LOGIC;
             LoadFlags : in STD_LOGIC;
             C_Flag : in STD_LOGIC;
             Reset_C : in STD_LOGIC;
             N_Flag : in STD_LOGIC;
             Reset_N : in STD_LOGIC;
             V_Flag : in STD_LOGIC;
             Reset_V : in STD_LOGIC;
             Z_Flag : in STD_LOGIC;
             Reset_Z : in STD_LOGIC;
             StatusVector : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component CPU_IR_21363904
      Port ( Clock : in STD_LOGIC;
             IL : in STD_LOGIC;
             Instruction : in STD_LOGIC_VECTOR (31 downto 0);
             DR : out STD_LOGIC_VECTOR (4 downto 0);
             Opcode : out STD_LOGIC_VECTOR (16 downto 0);
             SA : out STD_LOGIC_VECTOR (4 downto 0);
             SB : out STD_LOGIC_VECTOR (4 downto 0));
    end component;    
    
    component CPU_SignExtend_21363904
      Port ( Input : in STD_LOGIC_VECTOR (9 downto 0);
             Output : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component CPU_ZeroFill_21363904
      Port ( SB : in STD_LOGIC_VECTOR (4 downto 0);
             MuxB : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component CPU_PC_21363904
      Port ( Clock : in STD_LOGIC;
             Displacement : in STD_LOGIC_VECTOR (31 downto 0);
             PI : in STD_LOGIC;
             PL : in STD_LOGIC;
             Reset : in STD_LOGIC;
             InstAdd : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal sa : std_logic_vector (4 downto 0) := (others => '0');
    signal sb : std_logic_vector (4 downto 0) := (others => '0');
    signal dr : std_logic_vector (4 downto 0) := (others => '0');
    signal sx : std_logic_vector (9 downto 0) := (others => '0');
    signal sx_to_pc, pc_to_mux : std_logic_vector (31 downto 0) := (others => '0');
    signal zf_to_dp, dp_to_ram : std_logic_vector (31 downto 0) := (others => '0');
    signal dp_to_mux, mux_to_ram, ram_to_ir : std_logic_vector (31 downto 0) := (others => '0');
    signal dp_c_to_str, dp_n_to_str, dp_v_to_str, dp_z_to_str : std_logic := '0';

begin

--Port Maps

    --Datapath
    Datapath : DP_Datapath_21363904
    PORT MAP ( IR_IN => zf_to_dp,
               MB => MB,
               DATA_IN => ram_to_ir,
               MD => MD,
               FS => FS,
               Clock => Clock,
               DR => DR,
               RW => RW,
               SA => sa,
               SB => sb,
               TA => TA,
               TB => TB,
               TD => TD,
               DATA_OUT => dp_to_ram,
               N => dp_n_to_str,
               C => dp_c_to_str,
               Z => dp_z_to_str,
               V => dp_v_to_str,
               ADD => dp_to_mux);
               
    --RAM
    RAM : CPU_RAM_21363904
    PORT MAP ( Address => mux_to_ram,
               Clock => Clock,
               DataIn => dp_to_ram,
               WriteEnable => MW,
               DataOut => ram_to_ir);
               
    --MuxM
    MuxM : CPU_Mux2_32Bit_21363904
    PORT MAP ( Sel => MM,
               In0 => dp_to_mux,
               In1 => pc_to_mux,
               Z => mux_to_ram);
               
    --StatusReg
    StatusReg : CPU_StatusRegister_21363904
    PORT MAP ( Clock => Clock,
               LoadFlags => LoadFlags,
               C_Flag => dp_c_to_str,
               Reset_C => Reset_C,
               N_Flag => dp_n_to_str,
               Reset_N => Reset_N,
               V_Flag => dp_v_to_str,
               Reset_V => Reset_V,
               Z_Flag => dp_z_to_str,
               Reset_Z => Reset_Z,
               StatusVector => StatusVector);
               
    --InstReg
    InstReg : CPU_IR_21363904
    PORT MAP ( Clock => Clock,
               IL => IL,
               Instruction => ram_to_ir,
               DR => dr,
               Opcode => Opcode,
               SA => sa,
               SB => sb);
               
    --SignExt
    SignExt : CPU_SignExtend_21363904
    PORT MAP ( Input => sx,
               Output => sx_to_pc);
    sx(9 downto 5) <= dr;
    sx(4 downto 0) <= sb;
    
    --ZeroFill
    ZeroFill : CPU_ZeroFill_21363904
    PORT MAP ( SB => sb,
               MuxB => zf_to_dp);
    
    --PC
    PC : CPU_PC_21363904
    PORT MAP ( Clock => Clock,
               Displacement => sx_to_pc,
               PI => PI,
               PL => PL,
               Reset => Reset,
               InstAdd => pc_to_mux);

end Behavioral;
