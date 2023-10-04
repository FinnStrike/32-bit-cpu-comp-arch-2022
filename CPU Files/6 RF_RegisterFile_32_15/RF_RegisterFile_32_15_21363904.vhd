----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 10/19/2022 01:12:24 PM
-- Design Name: 
-- Module Name: RF_RegisterFile_32_15_21363904 - Behavioral
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

entity RF_RegisterFile_32_15_21363904 is
    Port ( SA : in STD_LOGIC_VECTOR (4 downto 0);   --Selects Source register A, Register00 to Register31 on Port A if TA[3:0] is set to "0000"
           SB : in STD_LOGIC_VECTOR (4 downto 0);   --Selects Source register B, Register00 to Register31 on Port B if TB[3:0] is set to "0000"
           DR : in STD_LOGIC_VECTOR (4 downto 0);   --Destination Register00 to Register31 
           RW : in STD_LOGIC;                       --If true, enables write operations to all Registers and Temp Registers
           Clock : in STD_LOGIC;                    --Clock signal for all Registers and Temp Registers
           D : in STD_LOGIC_VECTOR (31 downto 0);   --Data In for all Registers and Temp Registers
           TA : in STD_LOGIC_VECTOR (3 downto 0);   --If is set to "0000" it selects the output from the SA[4:0] sections, otherwise it selects Temp Register A, TempRegister01 to TempRegister15 on Port A
           TB : in STD_LOGIC_VECTOR (3 downto 0);   --If is set to "0000" it selects the output from the SB[4:0] sections, otherwise it selects Temp Register B, TempRegister01 to TempRegister15 on Port B
           TD : in STD_LOGIC_VECTOR (3 downto 0);   --If this set to "0000", RF_TempDestReg_Decoder_XXXXXXXX will set a signal for the Enable logic for Registers 00 to 31. Any other vector will select a 
                                                    --TempRegister01 to TempRegister15 and disable the Register 00 to 31 selection
           A : out STD_LOGIC_VECTOR (31 downto 0);  --Provides output from Register00 to Register 31 or TempRegister01 to TempRegister15 on Port B according to the SB[4:0] and TB[3:0] selection
           B : out STD_LOGIC_VECTOR (31 downto 0)); --Provides output from Register00 to Register 31 or TempRegister01 to TempRegister15 on Port A according to the SA[4:0] and TA[3:0] selection
end RF_RegisterFile_32_15_21363904;

architecture Behavioral of RF_RegisterFile_32_15_21363904 is

--Components

    component RF_DestReg_Decoder_21363904
        PORT( DR_D_D : in std_logic_vector (4 downto 0);
              DR_D_R00, DR_D_R01, DR_D_R02, DR_D_R03, DR_D_R04, DR_D_R05, DR_D_R06, DR_D_R07 : out std_logic;
              DR_D_R08, DR_D_R09, DR_D_R10, DR_D_R11, DR_D_R12, DR_D_R13, DR_D_R14, DR_D_R15 : out std_logic;
              DR_D_R16, DR_D_R17, DR_D_R18, DR_D_R19, DR_D_R20, DR_D_R21, DR_D_R22, DR_D_R23 : out std_logic;
              DR_D_R24, DR_D_R25, DR_D_R26, DR_D_R27, DR_D_R28, DR_D_R29, DR_D_R30, DR_D_R31 : out std_logic);
    end component;
    
    component RF_TempDestReg_Decoder_21363904
        PORT( TDR_D_D : in std_logic_vector (3 downto 0);
              TDR_D_Q00, TDR_D_R01, TDR_D_R02, TDR_D_R03, TDR_D_R04, TDR_D_R05, TDR_D_R06, TDR_D_R07 : out std_logic;
              TDR_D_R08, TDR_D_R09, TDR_D_R10, TDR_D_R11, TDR_D_R12, TDR_D_R13, TDR_D_R14, TDR_D_R15 : out std_logic);
    end component;
    
    component RF_Mux32_32Bit_21363904
        PORT( M32_s : in std_logic_vector (4 downto 0);
              M32_in00, M32_in01, M32_in02, M32_in03, M32_in04, M32_in05, M32_in06, M32_in07 : in std_logic_vector (31 downto 0);
              M32_in08, M32_in09, M32_in10, M32_in11, M32_in12, M32_in13, M32_in14, M32_in15 : in std_logic_vector (31 downto 0);
              M32_in16, M32_in17, M32_in18, M32_in19, M32_in20, M32_in21, M32_in22, M32_in23 : in std_logic_vector (31 downto 0);
              M32_in24, M32_in25, M32_in26, M32_in27, M32_in28, M32_in29, M32_in30, M32_in31 : in std_logic_vector (31 downto 0);
              M32_z : out std_logic_vector (31 downto 0));
    end component;
    
    component RF_Mux16_32Bit_21363904
        PORT( M16_s : in std_logic_vector (3 downto 0);
              M16_in00, M16_in01, M16_in02, M16_in03, M16_in04, M16_in05, M16_in06, M16_in07 : in std_logic_vector (31 downto 0);
              M16_in08, M16_in09, M16_in10, M16_in11, M16_in12, M16_in13, M16_in14, M16_in15 : in std_logic_vector (31 downto 0);
              M16_z : out std_logic_vector (31 downto 0));
    end component;
    
    component RF_Register32Bit_21363904 
        PORT( R32_D : in std_logic_vector (31 downto 0);
              R32_Load : in std_logic;
              R32_CLK : in std_logic;
              R32_Q : out std_logic_vector (31 downto 0));
    end component;
    
--Signals

    --Register Load signals
    signal load_R00, load_R01, load_R02, load_R03, load_R04, load_R05, load_R06, load_R07 : std_logic;
    signal load_R08, load_R09, load_R10, load_R11, load_R12, load_R13, load_R14, load_R15 : std_logic;
    signal load_R16, load_R17, load_R18, load_R19, load_R20, load_R21, load_R22, load_R23 : std_logic;
    signal load_R24, load_R25, load_R26, load_R27, load_R28, load_R29, load_R30, load_R31 : std_logic;
    
    --TempRegister Load signals
    signal load_TR01, load_TR02, load_TR03, load_TR04, load_TR05, load_TR06, load_TR07 : std_logic;
    signal load_TR08, load_TR09, load_TR10, load_TR11, load_TR12, load_TR13, load_TR14, load_TR15 : std_logic;
    
    --Register Output signals
    signal q_R00, q_R01, q_R02, q_R03, q_R04, q_R05, q_R06, q_R07 : std_logic_vector (31 downto 0);
    signal q_R08, q_R09, q_R10, q_R11, q_R12, q_R13, q_R14, q_R15 : std_logic_vector (31 downto 0);
    signal q_R16, q_R17, q_R18, q_R19, q_R20, q_R21, q_R22, q_R23 : std_logic_vector (31 downto 0);
    signal q_R24, q_R25, q_R26, q_R27, q_R28, q_R29, q_R30, q_R31 : std_logic_vector (31 downto 0);
    
    --TempRegister Output signals
    signal q_TR01, q_TR02, q_TR03, q_TR04, q_TR05, q_TR06, q_TR07 : std_logic_vector (31 downto 0);
    signal q_TR08, q_TR09, q_TR10, q_TR11, q_TR12, q_TR13, q_TR14, q_TR15 : std_logic_vector (31 downto 0);
    
    --Signal to disable the TempRegisters
    signal q_disable_temps : std_logic;
    
    --32Multiplexer Output signals
    signal m32_A, m32_B : std_logic_vector (31 downto 0);
    
begin

--PortMaps (i.e. the single worst pain I have ever experienced

    --Registers
    
    Register00: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R00 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R00);
              
    Register01: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R01 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R01);
              
    Register02: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R02 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R02);
              
    Register03: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R03 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R03);
              
    Register04: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R04 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R04);
              
    Register05: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R05 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R05);
              
    Register06: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R06 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R06);
              
    Register07: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R07 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R07);
              
    Register08: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R08 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R08);
              
    Register09: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R09 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R09);
              
    Register10: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R10 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R10);
              
    Register11: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R11 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R11);
              
    Register12: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R12 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R12);
                  
    Register13: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R13 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R13);
              
    Register14: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R14 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R14);
              
    Register15: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R15 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R15);
              
    Register16: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R16 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R16);
              
    Register17: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R17 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R17);
              
    Register18: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R18 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R18);
              
    Register19: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R19 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R19);
              
    Register20: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R20 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R20);
              
    Register21: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R21 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R21);
              
    Register22: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R22 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R22);
              
    Register23: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R23 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R23);
              
    Register24: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R24 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R24);
              
    Register25: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R25 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R25);
              
    Register26: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R26 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R26);
              
    Register27: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R27 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R27);
              
    Register28: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R28 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R28);
              
    Register29: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R29 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R29);
              
    Register30: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R30 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R30);
              
    Register31: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_R31 AND RW AND q_disable_temps,
              R32_CLK => Clock,
              R32_Q => q_R31);
              
     --TempRegisters
    
    TempReg01: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR01 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR01);
              
    TempReg02: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR02 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR02);
              
    TempReg03: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR03 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR03);
              
    TempReg04: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR04 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR04);
              
    TempReg05: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR05 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR05);
              
    TempReg06: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR06 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR06);
              
    TempReg07: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR07 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR07);
              
    TempReg08: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR08 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR08);
              
    TempReg09: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR09 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR09);
              
    TempReg10: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR10 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR10);
              
    TempReg11: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR11 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR11);
              
    TempReg12: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR12 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR12);
                  
    TempReg13: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR13 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR13);
              
    TempReg14: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR14 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR14);
              
    TempReg15: RF_Register32Bit_21363904 
    PORT MAP( R32_D => D,
              R32_Load => load_TR15 AND RW,
              R32_CLK => Clock,
              R32_Q => q_TR15);
              
    --32input Multiplexers
    
    Mux32_A: RF_Mux32_32Bit_21363904
    PORT MAP( M32_s => SA,
              M32_in00 => q_R00,
              M32_in01 => q_R01,
              M32_in02 => q_R02,
              M32_in03 => q_R03,
              M32_in04 => q_R04,
              M32_in05 => q_R05,
              M32_in06 => q_R06,
              M32_in07 => q_R07,
              M32_in08 => q_R08,
              M32_in09 => q_R09,
              M32_in10 => q_R10,
              M32_in11 => q_R11,
              M32_in12 => q_R12,
              M32_in13 => q_R13,
              M32_in14 => q_R14,
              M32_in15 => q_R15,
              M32_in16 => q_R16,
              M32_in17 => q_R17,
              M32_in18 => q_R18,
              M32_in19 => q_R19,
              M32_in20 => q_R20,
              M32_in21 => q_R21,
              M32_in22 => q_R22,
              M32_in23 => q_R23,
              M32_in24 => q_R24,
              M32_in25 => q_R25,
              M32_in26 => q_R26,
              M32_in27 => q_R27,
              M32_in28 => q_R28,
              M32_in29 => q_R29,
              M32_in30 => q_R30,
              M32_in31 => q_R31,
              M32_z => m32_A);
              
    Mux32_B: RF_Mux32_32Bit_21363904
    PORT MAP( M32_s => SB,
              M32_in00 => q_R00,
              M32_in01 => q_R01,
              M32_in02 => q_R02,
              M32_in03 => q_R03,
              M32_in04 => q_R04,
              M32_in05 => q_R05,
              M32_in06 => q_R06,
              M32_in07 => q_R07,
              M32_in08 => q_R08,
              M32_in09 => q_R09,
              M32_in10 => q_R10,
              M32_in11 => q_R11,
              M32_in12 => q_R12,
              M32_in13 => q_R13,
              M32_in14 => q_R14,
              M32_in15 => q_R15,
              M32_in16 => q_R16,
              M32_in17 => q_R17,
              M32_in18 => q_R18,
              M32_in19 => q_R19,
              M32_in20 => q_R20,
              M32_in21 => q_R21,
              M32_in22 => q_R22,
              M32_in23 => q_R23,
              M32_in24 => q_R24,
              M32_in25 => q_R25,
              M32_in26 => q_R26,
              M32_in27 => q_R27,
              M32_in28 => q_R28,
              M32_in29 => q_R29,
              M32_in30 => q_R30,
              M32_in31 => q_R31,
              M32_z => m32_B);
    
    --16input Multiplexers
    
    Mux16_A: RF_Mux16_32Bit_21363904
    PORT MAP( M16_s => TA,
              M16_in00 => m32_A,
              M16_in01 => q_TR01,
              M16_in02 => q_TR02,
              M16_in03 => q_TR03,
              M16_in04 => q_TR04,
              M16_in05 => q_TR05,
              M16_in06 => q_TR06,
              M16_in07 => q_TR07,
              M16_in08 => q_TR08,
              M16_in09 => q_TR09,
              M16_in10 => q_TR10,
              M16_in11 => q_TR11,
              M16_in12 => q_TR12,
              M16_in13 => q_TR13,
              M16_in14 => q_TR14,
              M16_in15 => q_TR15,
              M16_z => A);
              
    Mux16_B: RF_Mux16_32Bit_21363904
    PORT MAP( M16_s => TB,
              M16_in00 => m32_B,
              M16_in01 => q_TR01,
              M16_in02 => q_TR02,
              M16_in03 => q_TR03,
              M16_in04 => q_TR04,
              M16_in05 => q_TR05,
              M16_in06 => q_TR06,
              M16_in07 => q_TR07,
              M16_in08 => q_TR08,
              M16_in09 => q_TR09,
              M16_in10 => q_TR10,
              M16_in11 => q_TR11,
              M16_in12 => q_TR12,
              M16_in13 => q_TR13,
              M16_in14 => q_TR14,
              M16_in15 => q_TR15,
              M16_z => B);   
    
    --Destination Register Decoder
    
    DestReg_Decoder: RF_DestReg_Decoder_21363904
    PORT MAP( DR_D_D => DR,
              DR_D_R00 => load_R00,
              DR_D_R01 => load_R01,
              DR_D_R02 => load_R02,
              DR_D_R03 => load_R03,
              DR_D_R04 => load_R04,
              DR_D_R05 => load_R05,
              DR_D_R06 => load_R06,
              DR_D_R07 => load_R07,
              DR_D_R08 => load_R08,
              DR_D_R09 => load_R09,
              DR_D_R10 => load_R10,
              DR_D_R11 => load_R11,
              DR_D_R12 => load_R12,
              DR_D_R13 => load_R13,
              DR_D_R14 => load_R14,
              DR_D_R15 => load_R15,
              DR_D_R16 => load_R16,
              DR_D_R17 => load_R17,
              DR_D_R18 => load_R18,
              DR_D_R19 => load_R19,
              DR_D_R20 => load_R20,
              DR_D_R21 => load_R21,
              DR_D_R22 => load_R22,
              DR_D_R23 => load_R23,
              DR_D_R24 => load_R24,
              DR_D_R25 => load_R25,
              DR_D_R26 => load_R26,
              DR_D_R27 => load_R27,
              DR_D_R28 => load_R28,
              DR_D_R29 => load_R29,
              DR_D_R30 => load_R30,
              DR_D_R31 => load_R31);
    
    --Temp Destination Register Decoder
    
    TempDestReg_Decoder: RF_TempDestReg_Decoder_21363904
    PORT MAP( TDR_D_D => TD,
              TDR_D_Q00 => q_disable_temps,
              TDR_D_R01 => load_TR01,
              TDR_D_R02 => load_TR02,
              TDR_D_R03 => load_TR03,
              TDR_D_R04 => load_TR04,
              TDR_D_R05 => load_TR05,
              TDR_D_R06 => load_TR06,
              TDR_D_R07 => load_TR07,
              TDR_D_R08 => load_TR08,
              TDR_D_R09 => load_TR09,
              TDR_D_R10 => load_TR10,
              TDR_D_R11 => load_TR11,
              TDR_D_R12 => load_TR12,
              TDR_D_R13 => load_TR13,
              TDR_D_R14 => load_TR14,
              TDR_D_R15 => load_TR15);
    
end Behavioral;
