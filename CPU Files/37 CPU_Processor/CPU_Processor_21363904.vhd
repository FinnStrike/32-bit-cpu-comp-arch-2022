----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 22.12.2022 14:42:40
-- Design Name: 
-- Module Name: CPU_Processor_21363904 - Behavioral
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

entity CPU_Processor_21363904 is
  Port ( Clock : in STD_LOGIC;
         Reset : in STD_LOGIC);
end CPU_Processor_21363904;

architecture Behavioral of CPU_Processor_21363904 is

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
    
    component CPU_SMux_21363904
      Port ( C_Flag : in STD_LOGIC;
             MS : in STD_LOGIC_VECTOR (2 downto 0);
             N_Flag : in STD_LOGIC;
             Not_C_Flag : in STD_LOGIC;
             Not_Z_Flag : in STD_LOGIC;
             One : in STD_LOGIC;
             V_Flag : in STD_LOGIC;
             Z_Flag : in STD_LOGIC;
             Zero : in STD_LOGIC;
             CAR : out STD_LOGIC);
    end component;
    
    component CPU_Mux2_17Bit_21363904
      Port ( Sel : in STD_LOGIC;
             In0 : in STD_LOGIC_VECTOR (16 downto 0);
             In1 : in STD_LOGIC_VECTOR (16 downto 0);
             Z : out STD_LOGIC_VECTOR (16 downto 0));
    end component;
    
    component CPU_CAR_21363904
      Port ( Address : in STD_LOGIC_VECTOR (16 downto 0);
             Clock : in STD_LOGIC;
             LoadAdd : in STD_LOGIC;
             Reset : in STD_LOGIC;
             CMAdd : out STD_LOGIC_VECTOR (16 downto 0));
    end component;
    
    component CPU_ControlMemory_21363904
      Port ( Address : in STD_LOGIC_VECTOR (16 downto 0);
             FL : out STD_LOGIC;                        
             RZ : out STD_LOGIC;                        
             RN : out STD_LOGIC;                        
             RC : out STD_LOGIC;                        
             RV : out STD_LOGIC;                        
             MW : out STD_LOGIC;                        
             MM : out STD_LOGIC;                        
             RW : out STD_LOGIC;                        
             MD : out STD_LOGIC;                        
             FS : out STD_LOGIC_VECTOR (4 downto 0);    
             MB : out STD_LOGIC;                        
             TB : out STD_LOGIC_VECTOR (3 downto 0);    
             TA : out STD_LOGIC_VECTOR (3 downto 0);    
             TD : out STD_LOGIC_VECTOR (3 downto 0);    
             PL : out STD_LOGIC;                        
             PI : out STD_LOGIC;                        
             IL : out STD_LOGIC;                        
             MC : out STD_LOGIC;                        
             MS : out STD_LOGIC_VECTOR (2 downto 0);    
             NA : out STD_LOGIC_VECTOR (16 downto 0));  
    end component;
    
--Signals

    signal add_32, data_out_32 : std_logic_vector (31 downto 0) := (others => '0');
    signal pc_32, signext_32, muxm_32, ram_32, zerofill_32 : std_logic_vector (31 downto 0) := (others => '0');
    signal na_17, opcode_17, muxc_17, car_17 : std_logic_vector (16 downto 0) := (others => '0');
    signal sx_10 : std_logic_vector (9 downto 0) := (others => '0');
    signal fs_05, dr_05, sa_05, sb_05 : std_logic_vector (4 downto 0) := (others => '0');
    signal ta_04, tb_04, td_04, statusvector_04 : std_logic_vector (3 downto 0) := (others => '0');
    signal ms_03 : std_logic_vector (2 downto 0) := (others => '0');
    signal fl_01, rz_01, rn_01, rc_01, rv_01, mw_01, mm_01 : std_logic := '0';
    signal rw_01, md_01, mb_01, pl_01, pi_01, il_01, mc_01 : std_logic := '0';
    signal c_01, n_01, v_01, z_01, muxs_01, not_c_01, not_z_01 : std_logic := '0';

begin

--Port Maps

    --Datapath
    Datapath : DP_Datapath_21363904
    PORT MAP ( IR_IN => zerofill_32,
               MB => mb_01,
               DATA_IN => ram_32,
               MD => md_01,
               FS => fs_05,
               Clock => Clock,
               DR => dr_05,
               RW => rw_01,
               SA => sa_05,
               SB => sb_05,
               TA => ta_04,
               TB => tb_04,
               TD => td_04,
               DATA_OUT => data_out_32,
               N => n_01,
               C => c_01,
               Z => z_01,
               V => v_01,
               ADD => add_32);
               
    --RAM
    RAM : CPU_RAM_21363904
    PORT MAP ( Address => muxm_32,
               Clock => Clock,
               DataIn => data_out_32,
               WriteEnable => mw_01,
               DataOut => ram_32);
               
    --MuxM
    MuxM : CPU_Mux2_32Bit_21363904
    PORT MAP ( Sel => mm_01,
               In0 => add_32,
               In1 => pc_32,
               Z => muxm_32);
               
    --StatusReg
    StatusReg : CPU_StatusRegister_21363904
    PORT MAP ( Clock => Clock,
               LoadFlags => fl_01,
               C_Flag => c_01,
               Reset_C => rc_01,
               N_Flag => n_01,
               Reset_N => rn_01,
               V_Flag => v_01,
               Reset_V => rv_01,
               Z_Flag => z_01,
               Reset_Z => rz_01,
               StatusVector => statusvector_04);
               
    --InstReg
    InstReg : CPU_IR_21363904
    PORT MAP ( Clock => Clock,
               IL => il_01,
               Instruction => ram_32,
               DR => dr_05,
               Opcode => opcode_17,
               SA => sa_05,
               SB => sb_05);
               
    --SignExt
    SignExt : CPU_SignExtend_21363904
    PORT MAP ( Input => sx_10,
               Output => signext_32);
    sx_10(9 downto 5) <= dr_05;
    sx_10(4 downto 0) <= sb_05;
    
    --ZeroFill
    ZeroFill : CPU_ZeroFill_21363904
    PORT MAP ( SB => sb_05,
               MuxB => zerofill_32);
    
    --PC
    PC : CPU_PC_21363904
    PORT MAP ( Clock => Clock,
               Displacement => signext_32,
               PI => pi_01,
               PL => pl_01,
               Reset => Reset,
               InstAdd => pc_32);
               
    --MuxS
    MuxS : CPU_SMux_21363904
    PORT MAP ( C_Flag => statusvector_04(0),
               MS => ms_03,
               N_Flag => statusvector_04(2),
               Not_C_Flag => not_c_01,
               Not_Z_flag => not_z_01,
               One => '1',
               V_Flag => statusvector_04(1),
               Z_Flag => statusvector_04(3),
               Zero => '0',
               CAR => muxs_01);
    not_c_01 <= not statusvector_04(0);
    not_z_01 <= not statusvector_04(3);
    
    --MuxC
    MuxC : CPU_Mux2_17Bit_21363904
    PORT MAP ( Sel => mc_01,
               In0 => na_17,
               In1 => opcode_17,
               Z => muxc_17);
    
    --CAR
    CAR : CPU_CAR_21363904
    PORT MAP ( Address => muxc_17,
               Clock => Clock,
               LoadAdd => muxs_01,
               Reset => Reset,
               CMAdd => car_17);
    
    --ControlROM
    ControlROM : CPU_ControlMemory_21363904
    PORT MAP ( Address => car_17,
               FL => fl_01,
               RZ => rz_01,
               RN => rn_01,
               RC => rc_01,
               RV => rv_01,
               MW => mw_01,
               MM => mm_01,
               RW => rw_01,
               MD => md_01,
               FS => fs_05,
               MB => mb_01,
               TB => tb_04,
               TA => ta_04,
               TD => td_04,
               PL => pl_01,
               PI => pi_01,
               IL => il_01,
               MC => mc_01,
               MS => ms_03,
               NA => na_17);

end Behavioral;
