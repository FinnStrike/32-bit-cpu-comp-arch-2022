----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 03.12.2022 21:45:38
-- Design Name: 
-- Module Name: CPU_StatusRegister_21363904_TB - Sim
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

entity CPU_StatusRegister_21363904_TB is
--  Port ( ); N/A
end CPU_StatusRegister_21363904_TB;

architecture Sim of CPU_StatusRegister_21363904_TB is

--Components

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

--Signals

    signal clk_TB, load_TB, c_TB, n_TB, v_TB, z_TB : std_logic := '0';
    signal rc_TB, rn_TB, rv_TB, rz_TB : std_logic := '0';
    
    signal status_TB : std_logic_vector (3 downto 0) := (others => '0');

begin

--Unit Under Test

    uut : CPU_StatusRegister_21363904
    PORT MAP ( Clock => clk_TB,
               LoadFlags => load_TB,
               C_Flag => c_TB,
               Reset_C => rc_TB,
               N_Flag => n_TB,
               Reset_N => rn_TB,
               V_Flag => v_TB,
               Reset_V => rv_TB,
               Z_Flag => z_TB,
               Reset_Z => rz_TB,
               StatusVector => status_TB);
               
    clk_TB <= not clk_TB  after 20ns;
    
    stim_proc : process
    begin
    
        wait until clk_TB' event and clk_TB = '1';
        load_TB <= '1' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        c_TB <= '1' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        c_TB <= '0'after 5ns;
        rc_TB <= '1' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        n_TB <= '1' after 5ns;
        rc_TB <= '0' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        n_TB <= '0'after 5ns;
        rn_TB <= '1' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        v_TB <= '1' after 5ns;
        rn_TB <= '0' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        v_TB <= '0'after 5ns;
        rv_TB <= '1' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        z_TB <= '1' after 5ns;
        rv_TB <= '0' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        z_TB <= '0'after 5ns;
        rz_TB <= '1' after 5ns;
        
        wait until clk_TB' event and clk_TB = '1';
        load_TB <= '0' after 5ns;
        rz_TB <= '0' after 5ns;
        
    end process;

end Sim;
