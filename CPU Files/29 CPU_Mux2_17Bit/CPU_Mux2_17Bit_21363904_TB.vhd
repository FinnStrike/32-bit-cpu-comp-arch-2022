----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.12.2022 15:35:02
-- Design Name: 
-- Module Name: CPU_Mux2_17Bit_21363904_TB - Sim
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

entity CPU_Mux2_17Bit_21363904_TB is
--  Port ( ); N/A
end CPU_Mux2_17Bit_21363904_TB;

architecture Sim of CPU_Mux2_17Bit_21363904_TB is

--Components

    component CPU_Mux2_17Bit_21363904
    port ( Sel : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (16 downto 0);
           In1 : in STD_LOGIC_VECTOR (16 downto 0);
           Z : out STD_LOGIC_VECTOR (16 downto 0));
    end component;
    
--Signals

    signal s_TB : std_logic;
    signal in0_TB, in1_TB : std_logic_vector (16 downto 0) := (others => '0');
    
    signal z_TB : std_logic_vector (16 downto 0) := (others => '0');
    
begin

--Unit Under Test

    uut : CPU_Mux2_17Bit_21363904
    PORT MAP ( Sel => s_TB,
               In0 => in0_TB,
               In1 => in1_TB,
               Z => z_TB);
               
    stim_proc : process
    begin
    
        wait for 20ns;
        s_TB <= '0';
        in0_TB <= "00000000000000110";
        in1_TB <= "00000000000001001";
        
        wait for 20ns;
        s_TB <= '1';
    
    end process;
    
end Sim;
