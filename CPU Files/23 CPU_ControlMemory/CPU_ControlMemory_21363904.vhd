----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.12.2022 19:13:03
-- Design Name: 
-- Module Name: CPU_ControlMemory_21363904 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU_ControlMemory_21363904 is
  Port ( Address : in STD_LOGIC_VECTOR (16 downto 0);
         FL : out STD_LOGIC;                        -- 0
         RZ : out STD_LOGIC;                        -- 1
         RN : out STD_LOGIC;                        -- 2
         RC : out STD_LOGIC;                        -- 3
         RV : out STD_LOGIC;                        -- 4
         MW : out STD_LOGIC;                        -- 5
         MM : out STD_LOGIC;                        -- 6
         RW : out STD_LOGIC;                        -- 7
         MD : out STD_LOGIC;                        -- 8
         FS : out STD_LOGIC_VECTOR (4 downto 0);    -- 9-13
         MB : out STD_LOGIC;                        -- 14
         TB : out STD_LOGIC_VECTOR (3 downto 0);    -- 15-18
         TA : out STD_LOGIC_VECTOR (3 downto 0);    -- 19-22
         TD : out STD_LOGIC_VECTOR (3 downto 0);    -- 23-26
         PL : out STD_LOGIC;                        -- 27
         PI : out STD_LOGIC;                        -- 28
         IL : out STD_LOGIC;                        -- 29
         MC : out STD_LOGIC;                        -- 30
         MS : out STD_LOGIC_VECTOR (2 downto 0);    -- 31-33
         NA : out STD_LOGIC_VECTOR (16 downto 0));  -- 34-50
end CPU_ControlMemory_21363904;

architecture Behavioral of CPU_ControlMemory_21363904 is

-- we use the least significant 7 bit of the Address - array(0 to 127)
    type ROM_array is array(0 to 127) of STD_LOGIC_VECTOR (50 downto 0);
    signal ROM : ROM_array :=(
    --|50             34|33  31|30| 29| 28| 27|26  23|22  19|18  15| 14|13   09| 08| 07| 06| 05| 04| 03| 02| 01| 00| Control Memory
    --|  Next Address   |  MS  |MC| IL| PI| PL|  TD  |  TA  |  TB  | MB|   FS  | MD| RW| MM| MW| RV| RC| RN| RZ| FL| Address
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 00
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 01
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 02
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 03
    --Fetch Instruction
      "00000000000011000"&"001"&'0'&'1'&'1'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0', -- 04
    --Load Data
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 05
    --A + NOT(B) + 1
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00101"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 06
    --NOT(A)
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"01110"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 07
    --A + NOT(B)
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00100"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 08
    --A
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00111"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 09
    --A + B + 1
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00011"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 0A
    --B >> 1
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"10100"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 0B
    --A + B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00010"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 0C
    --B << 1
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"11000"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 0D
    --A
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 0E
    --B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"10000"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 0F
    --A + 1
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00001"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 10
    --A XOR B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"01100"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 11
    --A OR B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"01010"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 12
    --A - 1
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00110"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 13
    --A AND B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"01000"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 14
    --Store Data
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'1'&'0'&'0'&'0'&'0'&'0', -- 15
    --Branch
      "00000000000000100"&"001"&'0'&'0'&'0'&'1'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 16
    --Load Immediate via MuxB
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'1'&"10000"&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 17
    --Execute Instruction
      "00000000001111111"&"001"&'1'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 18
    --The following control words implement Shift-Add Multiplication
    --|50             34|33  31|30| 29| 28| 27|26  23|22  19|18  15| 14|13   09| 08| 07| 06| 05| 04| 03| 02| 01| 00| Control Memory
    --|  Next Address   |  MS  |MC| IL| PI| PL|  TD  |  TA  |  TB  | MB|   FS  | MD| RW| MM| MW| RV| RC| RN| RZ| FL| Address
    --Register Transfer R[SA] into TR1
      "00000000000011010"&"000"&'0'&'0'&'0'&'0'&"0001"&"0000"&"0000"&'0'&"00111"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 19
    --Register Transfer R[SB] into TR2
      "00000000000011011"&"000"&'0'&'0'&'0'&'0'&"0010"&"0000"&"0000"&'0'&"10000"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 1A
    --TR1 XOR TR1 = 0 into TR3
      "00000000000011100"&"000"&'0'&'0'&'0'&'0'&"0011"&"0001"&"0001"&'0'&"01100"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 1B
    --TR3 + 1 = 1 into TR4
      "00000000000011101"&"000"&'0'&'0'&'0'&'0'&"0100"&"0011"&"0000"&'0'&"00001"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'1'&'0', -- 1C
    --TR2 AND TR4, FL
      "00000000000011110"&"000"&'0'&'0'&'0'&'0'&"0000"&"0010"&"0100"&'0'&"01000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 1D
    --(Z = 1)? Branch to 20, else next
      "00000000000100000"&"100"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 1E
    --TR3 + TR1 into TR3
      "00000000000100000"&"000"&'0'&'0'&'0'&'0'&"0011"&"0011"&"0001"&'0'&"00010"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 1F
    --TR1 << 1 into TR1
      "00000000000100001"&"000"&'0'&'0'&'0'&'0'&"0001"&"0000"&"0001"&'0'&"11000"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'1'&'0', -- 20
    --TR2 >> 1 into TR2, FL
      "00000000000100010"&"000"&'0'&'0'&'0'&'0'&"0010"&"0000"&"0010"&'0'&"10100"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1', -- 21
    --(NZ = 1)? Branch to 1D, else next
      "00000000000011101"&"111"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 22
    --Register Transfer TR3 into R[DR]
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0011"&"0000"&'0'&"00111"&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'1'&'0', -- 23
    --End of Shift-Add Multiplication
    --Unused Memory
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 24
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 25
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 26
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 27
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 28
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 29
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 2A
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 2B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 2C
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 2D
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 2E
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 2F
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 30
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 31
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 32
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 33
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 34
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 35
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 36
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 37
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 38
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 39
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 3A
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 3B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 3C
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 3D
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 3E
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 3F
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 40
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 41
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 42
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 43
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 44
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 45
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 46
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 47
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 48
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 49
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 4A
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 4B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 4C
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 4D
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 4E
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 4F
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 50
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 51
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 52
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 53
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 54
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 55
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 56
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 57
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 58
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 59
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 5A
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 5B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 5C
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 5D
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 5E
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 5F
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 60
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 61
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 62
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 63
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 64
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 65
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 66
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 67
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 68
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 69
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 6A
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 6B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 6C
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 6D
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 6E
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 6F
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 70
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 71
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 72
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 73
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 74
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 75
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 76
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 77
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 78
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 79
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 7A
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 7B
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 7C
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 7D
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0', -- 7E
      "00000000000000100"&"001"&'0'&'0'&'0'&'0'&"0000"&"0000"&"0000"&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'  -- 7F
    );
    
    signal content_at_address : STD_LOGIC_VECTOR (50 downto 0);
        
begin

    content_at_address <= ROM(to_integer(unsigned(Address(6 downto 0)))) after 2ns;
                          NA <= content_at_address(50 downto 34);   -- 34-50
                          MS <= content_at_address(33 downto 31);   -- 31-33
                          MC <= content_at_address(30);             -- 30
                          IL <= content_at_address(29);             -- 29
                          PI <= content_at_address(28);             -- 28
                          PL <= content_at_address(27);             -- 27
                          TD <= content_at_address(26 downto 23);   -- 23-26
                          TA <= content_at_address(22 downto 19);   -- 19-22
                          TB <= content_at_address(18 downto 15);   -- 15-18
                          MB <= content_at_address(14);             -- 14
                          FS <= content_at_address(13 downto 9);    -- 09-13
                          MD <= content_at_address(8);              -- 08
                          RW <= content_at_address(7);              -- 07
                          MM <= content_at_address(6);              -- 06
                          MW <= content_at_address(5);              -- 05
                          RV <= content_at_address(4);              -- 04
                          RC <= content_at_address(3);              -- 03
                          RN <= content_at_address(2);              -- 02
                          RZ <= content_at_address(1);              -- 01
                          FL <= content_at_address(0);              -- 00 

end Behavioral;