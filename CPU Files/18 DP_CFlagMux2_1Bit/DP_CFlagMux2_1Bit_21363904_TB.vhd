----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 06.11.2022 20:48:11
-- Design Name: 
-- Module Name: DP_CFlagMux2_1Bit_21363904_TB - Sim
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

entity DP_CFlagMux2_1Bit_21363904_TB is
--  Port ( ); N/A
end DP_CFlagMux2_1Bit_21363904_TB;

architecture Sim of DP_CFlagMux2_1Bit_21363904_TB is

--Components

    component DP_CFlagMux2_1Bit_21363904
    port ( FS4 : in STD_LOGIC;
           C_ALU : in STD_LOGIC;
           C_Shift : in STD_LOGIC;
           C : out STD_LOGIC);
    end component;

--Signals

    signal fs4_TB, c_alu_TB, c_shift_TB : std_logic;
    
    signal c_TB : std_logic;

begin

--Unit Under Test

    uut: DP_CFlagMux2_1Bit_21363904
    PORT MAP ( FS4 => fs4_TB,
               C_ALU => c_alu_TB,
               C_Shift => c_shift_TB,
               C => c_TB);
    
    stim_proc : process
    begin
    
        wait for 20ns;
        fs4_TB <= '0';
        c_alu_TB <= '1';
        c_shift_TB <= '0';
        
        wait for 20ns;
        fs4_TB <= '1';
        
        wait for 20ns;
        c_shift_TB <= '1';
        c_alu_TB <= '0';
        
        wait for 20ns;
        fs4_TB <= '0';
    
    end process;

end Sim;
