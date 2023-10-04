----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 28.11.2022 13:36:04
-- Design Name: 
-- Module Name: CPU_RAM_21363904 - Behavioral
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

entity CPU_RAM_21363904 is
  Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
         Clock : in STD_LOGIC;
         DataIn : in STD_LOGIC_VECTOR (31 downto 0);
         WriteEnable : in STD_LOGIC;
         DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end CPU_RAM_21363904;

architecture Behavioral of CPU_RAM_21363904 is

    type RAM_array is array(0 to 127) of STD_LOGIC_VECTOR (31 downto 0);
    signal RAM : RAM_array:=(
    X"00000004",-- 00
    X"00000005",-- 01
    X"00000006",-- 02
--Machine Code
--Student ID = 21363904
--Machine Code starts at digit 3 of ID = 3
--Begin Program
  --|      Opcode      |  DR   |  SA   |  SB   |
  --Load R2 with 0x7 via Load Immediate using MuxB
    "00000000000010111"&"00010"&"00000"&"00111",-- 03
  --Branch to sl4_R0 to assign 0x70 to R0 - Displace to 0x3C
    "00000000000010110"&"00001"&"00000"&"10111",-- 04
  --Load Data from 0x70 into R1
    "00000000000000101"&"00001"&"00000"&"00000",-- 05
  --Increment R0
    "00000000000010000"&"00000"&"00000"&"00000",-- 06
  --Load Data from 0x71 into R2
    "00000000000000101"&"00010"&"00000"&"00000",-- 07
  --Increment R0
    "00000000000010000"&"00000"&"00000"&"00000",-- 08
  --R1 + NOT(R2) + 1 = R3
    "00000000000000110"&"00011"&"00001"&"00010",-- 09
  --NOT(R3) = R3
    "00000000000000111"&"00011"&"00011"&"00010",-- 0A
  --R3 + NOT(R2) = R3
    "00000000000001000"&"00011"&"00011"&"00010",-- 0B
  --R1 = R3
    "00000000000001001"&"00001"&"00011"&"00010",-- 0C
  --R1 + R2 + 1 = R3
    "00000000000001010"&"00011"&"00001"&"00010",-- 0D
  --Branch to sr2 - Displace to 0x2C
    "00000000000010110"&"00000"&"00001"&"11101",-- 0E
  --R2 + R3 = R3
    "00000000000001100"&"00011"&"00011"&"00010",-- 0F
  --Branch to sl4_R2 - Displace to 0x41
    "00000000000010110"&"00001"&"00011"&"10000",-- 10
  --R1 = R3
    "00000000000001110"&"00001"&"00011"&"00010",-- 11
  --R3 = R2
    "00000000000001111"&"00011"&"00001"&"00010",-- 12
  --R1 + 1 = R1
    "00000000000010000"&"00001"&"00001"&"00010",-- 13
  --R1 XOR R2 = R3
    "00000000000010001"&"00011"&"00001"&"00010",-- 14
  --R1 OR R3 = R3
    "00000000000010010"&"00011"&"00001"&"00011",-- 15
  --R3 - 1 = R3
    "00000000000010011"&"00011"&"00011"&"00010",-- 16
  --R2 AND R3 = R1
    "00000000000010100"&"00001"&"00011"&"00010",-- 17
  --R1 * R2 = R3 (Multi-Cycle Shift-Add Multiplication)
    "00000000000011001"&"00011"&"00001"&"00010",-- 18
  --Store Data from R3 into 0x72
    "00000000000010101"&"00000"&"00000"&"00011",-- 19
  --Decrement R0
    "00000000000010011"&"00000"&"00000"&"00000",-- 1A
  --Store Data from R2 into 0x71
    "00000000000010101"&"00000"&"00000"&"00010",-- 1B
  --Decrement R0
    "00000000000010011"&"00000"&"00000"&"00000",-- 1C
  --Store Data from R1 into 0x70
    "00000000000010101"&"00000"&"00000"&"00001",-- 1D
--End Program
    "00000000000011000"&"00000"&"00000"&"00000",-- 1E
    X"00000023",-- 1F
    X"00000024",-- 20
    X"00000025",-- 21
    X"00000026",-- 22
    X"00000027",-- 23
    X"00000028",-- 24
    X"00000029",-- 25
    X"0000002A",-- 26
    X"0000002B",-- 27
    X"0000002C",-- 28
    X"0000002D",-- 29
    X"0000002E",-- 2A
    X"0000002F",-- 2B
--sr2
  --R2 >> 1 = R2
    "00000000000001011"&"00010"&"00000"&"00010",-- 2C
  --R2 >> 1 = R2
    "00000000000001011"&"00010"&"00000"&"00010",-- 2D
  --Branch to Main - Displace to 0x0F
    "00000000000010110"&"11111"&"00000"&"00000",-- 2E
    X"00000033",-- 2F
    X"00000034",-- 30
    X"00000035",-- 31
    X"00000036",-- 32
    X"00000037",-- 33
    X"00000038",-- 34
    X"00000039",-- 35
    X"0000003A",-- 36
    X"0000003B",-- 37
    X"0000003C",-- 38
    X"0000003D",-- 39
    X"0000003E",-- 3A
    X"0000003F",-- 3B
--sl4_R0
  --R0 << 1 = R0
    "00000000000001101"&"00000"&"00000"&"00000",-- 3C
  --R0 << 1 = R0
    "00000000000001101"&"00000"&"00000"&"00000",-- 3D
  --R0 << 1 = R0
    "00000000000001101"&"00000"&"00000"&"00000",-- 3E
  --R0 << 1 = R2
    "00000000000001101"&"00000"&"00000"&"00000",-- 3F
  --Branch to Main - Displace to 0x05
    "00000000000010110"&"11110"&"00000"&"00100",-- 40
--sl4_R2
  --R2 << 1 = R2
    "00000000000001101"&"00010"&"00000"&"00010",-- 41
  --R2 << 1 = R2
    "00000000000001101"&"00010"&"00000"&"00010",-- 42
  --R2 << 1 = R2
    "00000000000001101"&"00010"&"00000"&"00010",-- 43
  --R2 << 1 = R2
    "00000000000001101"&"00010"&"00000"&"00010",-- 44
  --Branch to Main - Displace to 0x11
    "00000000000010110"&"11110"&"00000"&"01011",-- 45
    X"0000004A",-- 46
    X"0000004B",-- 47
    X"0000004C",-- 48
    X"0000004D",-- 49
    X"0000004E",-- 4A
    X"0000004F",-- 4B
    X"00000050",-- 4C
    X"00000051",-- 4D
    X"00000052",-- 4E
    X"00000053",-- 4F
    X"00000054",-- 50
    X"00000055",-- 51
    X"00000056",-- 52
    X"00000057",-- 53
    X"00000058",-- 54
    X"00000059",-- 55
    X"0000005A",-- 56
    X"0000005B",-- 57
    X"0000005C",-- 58
    X"0000005D",-- 59
    X"0000005E",-- 5A
    X"0000005F",-- 5B
    X"00000060",-- 5C
    X"00000061",-- 5D
    X"00000062",-- 5E
    X"00000063",-- 5F
    X"00000064",-- 60
    X"00000065",-- 61
    X"00000066",-- 62
    X"00000067",-- 63
    X"00000068",-- 64
    X"00000069",-- 65
    X"0000006A",-- 66
    X"0000006B",-- 67
    X"0000006C",-- 68
    X"0000006D",-- 69
    X"0000006E",-- 6A
    X"0000006F",-- 6B
    X"00000070",-- 6C
    X"00000071",-- 6D
    X"00000072",-- 6E
    X"00000073",-- 6F
  --Data Values - Should all have following values after program is run:
    X"00000003",-- 70   Value After Program: 0x10
    X"00000006",-- 71   Value After Program: 0x10
    X"00000000",-- 72   Value After Program: 0x100
  --End Data Values
    X"00000077",-- 73
    X"00000078",-- 74
    X"00000079",-- 75
    X"0000007A",-- 76
    X"0000007B",-- 77
    X"0000007C",-- 78
    X"0000007D",-- 79
    X"0000007E",-- 7A
    X"0000007F",-- 7B
    X"00000080",-- 7C
    X"00000081",-- 7D
    X"00000082",-- 7E
    X"00000083" -- 7F
    );

begin

    process (Clock)
    begin
    
        if Clock' event and Clock = '1' then
            if WriteEnable = '1' then
                RAM(to_integer(unsigned(Address(6 downto 0)))) <= DataIn after 2ns;
            end if;
        end if;
        
    end process;
    
    DataOut <= RAM(to_integer(unsigned(Address(6 downto 0)))) after 2ns;

end Behavioral;
