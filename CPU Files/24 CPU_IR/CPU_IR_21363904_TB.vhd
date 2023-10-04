----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 07.12.2022 18:40:51
-- Design Name: 
-- Module Name: CPU_IR_21363904_TB - Sim
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

entity CPU_IR_21363904_TB is
--  Port ( ); N/A
end CPU_IR_21363904_TB;

architecture Sim of CPU_IR_21363904_TB is

--Components

    component CPU_IR_21363904
      Port ( Clock : in STD_LOGIC;
             IL : in STD_LOGIC;
             Instruction : in STD_LOGIC_VECTOR (31 downto 0);
             DR : out STD_LOGIC_VECTOR (4 downto 0);
             Opcode : out STD_LOGIC_VECTOR (16 downto 0);
             SA : out STD_LOGIC_VECTOR (4 downto 0);
             SB : out STD_LOGIC_VECTOR (4 downto 0));
    end component;    

--Signals

    signal clk_TB, il_TB : std_logic := '0';
    signal inst_TB : std_logic_vector (31 downto 0) := (others => '0');
    
    signal opcode_TB : std_logic_vector (16 downto 0) := (others => '0');
    signal dr_TB, sa_TB, sb_TB : std_logic_vector (4 downto 0) := (others => '0');

begin

--Unit Under Test   

    uut : CPU_IR_21363904
    PORT MAP ( Clock => clk_TB,
               IL => il_TB,
               Instruction => inst_TB,
               DR => dr_TB,
               Opcode => opcode_TB,
               SA => sa_TB,
               SB => sb_TB);
               
    clk_TB <= not clk_TB after 10ns;
    
    stim_proc : process
    begin
    
        --Student ID = 21363904
        
        --Opcode: 21363904
        --           ^^
        -- 63 = 00000000000111111
        
        --DR: 21363904
        --           ^
        -- 4 = 00100
        
        --SA: 21363904
        --          ^
        -- 0 = 00000
        
        --SB: 21363904
        --         ^
        -- 9 = 01001
        
        --Instruction = Opcode + DR + SA + SB =
        -- 00000000000111111 + 00100 + 00000 + 01001 =
        -- 00000000000111111001000000001001
    
        wait until clk_TB' event and clk_TB = '1';
        il_TB <= '1' after 5ns;
        inst_TB <= "00000000000111111001000000001001" after 5ns;
        
    end process;

end Sim;
