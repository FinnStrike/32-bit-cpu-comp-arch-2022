----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 22.12.2022 12:29:22
-- Design Name: 
-- Module Name: CPU_Processor_Test04_21363904 - Behavioral
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

entity CPU_Processor_Test04_21363904 is
  Port ( StatusVector : in STD_LOGIC_VECTOR (3 downto 0);
         Clock : in STD_LOGIC;
         Reset : in STD_LOGIC;
         Opcode : in STD_LOGIC_VECTOR (16 downto 0);
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
         IL : out STD_LOGIC);                    
end CPU_Processor_Test04_21363904;

architecture Behavioral of CPU_Processor_Test04_21363904 is

--Components

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

    signal muxc_to_car, car_to_rom, rom_to_muxc_17 : std_logic_vector (16 downto 0) := (others => '0');
    signal rom_to_muxs : std_logic_vector (2 downto 0) := (others => '0');
    signal muxs_to_car, not_c, not_z, rom_to_muxc : std_logic := '0';

begin

--PORT MAPS

    --MuxS
    MuxS : CPU_SMux_21363904
    PORT MAP ( C_Flag => StatusVector(0),
               MS => rom_to_muxs,
               N_Flag => StatusVector(2),
               Not_C_Flag => not_c,
               Not_Z_flag => not_z,
               One => '1',
               V_Flag => StatusVector(1),
               Z_Flag => StatusVector(3),
               Zero => '0',
               CAR => muxs_to_car);
    not_c <= not StatusVector(0);
    not_z <= not StatusVector(3);
    
    --MuxC
    MuxC : CPU_Mux2_17Bit_21363904
    PORT MAP ( Sel => rom_to_muxc,
               In0 => rom_to_muxc_17,
               In1 => Opcode,
               Z => muxc_to_car);
    
    --CAR
    CAR : CPU_CAR_21363904
    PORT MAP ( Address => muxc_to_car,
               Clock => Clock,
               LoadAdd => muxs_to_car,
               Reset => Reset,
               CMAdd => car_to_rom);
    
    --ControlROM
    ControlROM : CPU_ControlMemory_21363904
    PORT MAP ( Address => car_to_rom,
               FL => FL,
               RZ => RZ,
               RN => RN,
               RC => RC,
               RV => RV,
               MW => MW,
               MM => MM,
               RW => RW,
               MD => MD,
               FS => FS,
               MB => MB,
               TB => TB,
               TA => TA,
               TD => TD,
               PL => PL,
               PI => PI,
               IL => IL,
               MC => rom_to_muxc,
               MS => rom_to_muxs,
               NA => rom_to_muxc_17);

end Behavioral;
