----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 10:47:46
-- Design Name: 
-- Module Name: RF_Register32Bit_21363904_TB - Sim
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

entity RF_Register32Bit_21363904_TB is
--  Port ( ); N/A
end RF_Register32Bit_21363904_TB;

architecture Sim of RF_Register32Bit_21363904_TB is

--Components
    
    component RF_Register32Bit_21363904
    port( R32_D : in STD_LOGIC_VECTOR (31 downto 0);
          R32_Load : in STD_LOGIC;
          R32_CLK : in STD_LOGIC;
          R32_Q : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal d_TB : std_logic_vector(31 downto 0):= (others => '0');
    signal load_TB : std_logic:= '0';
    signal clk_TB : std_logic:= '0';

    signal q_TB : std_logic_vector(31 downto 0):= (others => '0');

begin

--Unit Under Test

   uut: RF_Register32Bit_21363904 
   PORT MAP( R32_D => d_TB,
             R32_Load => load_TB,
             R32_CLK => clk_TB,
             R32_Q => q_TB);
        
   clk_TB <= not clk_TB after 10ns;
   
   stim_proc: process
   begin
   
       wait until clk_TB'event and clk_TB='1';
       load_TB <= '0';
       d_TB <= "00000001010001011111110011000000";
       
       wait until clk_TB'event and clk_TB='1';
       load_TB <= '1';
       
       wait until clk_TB'event and clk_TB='1';
       load_TB <= '0';
       d_TB <= "00000000000000000000000000000000";
       
       wait until clk_TB'event and clk_TB='1';
       load_TB <= '1';
       
   end process;  

end Sim;
