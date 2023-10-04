----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 21.12.2022 16:11:10
-- Design Name: 
-- Module Name: CPU_SMux_21363904_TB - Sim
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

entity CPU_SMux_21363904_TB is
--  Port ( ); N/A
end CPU_SMux_21363904_TB;

architecture Sim of CPU_SMux_21363904_TB is

--Component

    component CPU_SMux_21363904
    port ( C_Flag : in STD_LOGIC;
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
    
--Signals

    signal ms_TB : std_logic_vector (2 downto 0) := (others => '0');
    signal c_TB, n_TB, v_TB, z_TB, nc_TB, nz_TB : std_logic := '0';
    
    signal car_TB : std_logic := '0';

begin

--Unit Under Test

    uut : CPU_SMux_21363904
    PORT MAP ( C_Flag => c_TB,
               MS => ms_TB,
               N_Flag => n_TB,
               Not_C_Flag => nc_TB,
               Not_Z_Flag => nz_TB,
               One => '1',
               V_Flag => v_TB,
               Z_Flag => z_TB,
               Zero => '0',
               CAR => car_TB);
    
    stim_proc : process
    begin
    
        wait for 20ns;
        c_TB <= '0';
        n_TB <= '0';
        v_TB <= '0';
        z_TB <= '0';
        nc_TB <= '0';
        nz_TB <= '0';
        ms_TB <= "000";
        
        wait for 20ns;
        ms_TB <= "001";
        
        wait for 20ns;
        ms_TB <= "010";
        
        wait for 20ns;
        c_TB <= '1';
        
        wait for 20ns;
        ms_TB <= "011";
        
        wait for 20ns;
        v_TB <= '1';
        
        wait for 20ns;
        ms_TB <= "100";
        
        wait for 20ns;
        z_TB <= '1';
        
        wait for 20ns;
        ms_TB <= "101";
        
        wait for 20ns;
        n_TB <= '1';
        
        wait for 20ns;
        ms_TB <= "110";
        
        wait for 20ns;
        nc_TB <= '1';
        
        wait for 20ns;
        ms_TB <= "111";
        
        wait for 20ns;
        nz_TB <= '1';
        
    end process;

end Sim;
