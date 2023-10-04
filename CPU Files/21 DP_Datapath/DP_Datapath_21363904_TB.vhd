----------------------------------------------------------------------------------
-- Company: SCSS - Trinity College Dublin
-- Engineer: Fionn Murphy - 21363904
-- 
-- Create Date: 10.11.2022 13:44:38
-- Design Name: 
-- Module Name: DP_Datapath_21363904_TB - Sim
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

entity DP_Datapath_21363904_TB is
--  Port ( ); N/A
end DP_Datapath_21363904_TB;

architecture Sim of DP_Datapath_21363904_TB is

--Components

    component DP_Datapath_21363904 is
    port ( IR_IN : in STD_LOGIC_VECTOR (31 downto 0);
           MB : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (31 downto 0);
           MD : in STD_LOGIC;
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           Clock : in STD_LOGIC;
           DR : in STD_LOGIC_VECTOR (4 downto 0);
           RW : in STD_LOGIC;
           SA : in STD_LOGIC_VECTOR (4 downto 0);
           SB : in STD_LOGIC_VECTOR (4 downto 0);
           TA : in STD_LOGIC_VECTOR (3 downto 0);
           TB : in STD_LOGIC_VECTOR (3 downto 0);
           TD : in STD_LOGIC_VECTOR (3 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (31 downto 0);
           N : out STD_LOGIC;
           C : out STD_LOGIC;
           Z : out STD_LOGIC;
           V : out STD_LOGIC;
           ADD : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
--Signals

    signal ir_in_TB, data_in_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal fs_TB, dr_TB, sa_TB, sb_TB : std_logic_vector (4 downto 0) := (others => '0');
    signal ta_TB, tb_TB, td_TB : std_logic_vector (3 downto 0) := (others => '0');
    signal mb_TB, md_TB, clk_TB, rw_TB : std_logic := '0';
    
    signal data_out_TB, add_TB : std_logic_vector (31 downto 0) := (others => '0');
    signal n_TB, c_TB, z_TB, v_TB : std_logic := '0';

begin

--Unit Under Test

    uut : DP_Datapath_21363904
    PORT MAP ( IR_IN => ir_in_TB,
               MB => mb_TB,
               DATA_IN => data_in_TB,
               MD => md_TB,
               FS => fs_TB,
               Clock => clk_TB,
               DR => dr_TB,
               RW => rw_TB,
               SA => sa_TB,
               SB => sb_TB,
               TA => ta_TB,
               TB => tb_TB,
               TD => td_TB,
               DATA_OUT => data_out_TB,
               N => n_TB,
               C => c_TB,
               Z => z_TB,
               V => v_TB,
               ADD => add_TB);
               
    clk_TB <= not clk_TB after 180ns;
    
    stim_proc : process
    begin
    
--Load all registers
        
        wait until clk_TB'event and clk_TB = '1';
        rw_TB <= '1';
        td_TB <= "0000";
        ta_TB <= "0000";
        tb_TB <= "0000";
        sa_TB <= "00000";
        sb_TB <= "00000";
        dr_TB <= "00000";
        data_in_TB <= "00000001010001011111110011000000";
        ir_in_TB <= "00000000000000000000000000000000";
        fs_TB <= "00000";
        mb_TB <= '0';
        md_TB <= '1';
        
        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010111111";
        dr_TB <= "00001";
        
        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010111110";
        dr_TB <= "00010";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010111101";
        dr_TB <= "00011";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010111100";
        dr_TB <= "00100";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010111011";
        dr_TB <= "00101";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010111010";
        dr_TB <= "00110";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010111001";
        dr_TB <= "00111";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010111000";
        dr_TB <= "01000";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010110111";
        dr_TB <= "01001";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010110110";
        dr_TB <= "01010";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010110101";
        dr_TB <= "01011";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010110100";
        dr_TB <= "01100";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010110011";
        dr_TB <= "01101";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010110010";
        dr_TB <= "01110";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010110001";
        dr_TB <= "01111";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010110000";
        dr_TB <= "10000";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010101111";
        dr_TB <= "10001";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010101110";
        dr_TB <= "10010";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010101101";
        dr_TB <= "10011";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010101100";
        dr_TB <= "10100";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010101011";
        dr_TB <= "10101";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010101010";
        dr_TB <= "10110";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010101001";
        dr_TB <= "10111";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010101000";
        dr_TB <= "11000";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010100111";
        dr_TB <= "11001";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010100110";
        dr_TB <= "11010";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010100101";
        dr_TB <= "11011";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010100100";
        dr_TB <= "11100";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010100011";
        dr_TB <= "11101";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010100010";
        dr_TB <= "11110";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010100001";
        dr_TB <= "11111";
        
--Load all temp registers
        
        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010100000";
        td_TB <= "0001";
        
        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010011111";
        td_TB <= "0010";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010011110";
        td_TB <= "0011";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010011101";
        td_TB <= "0100";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010011100";
        td_TB <= "0101";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010011011";
        td_TB <= "0110";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010011010";
        td_TB <= "0111";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010011001";
        td_TB <= "1000";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010011000";
        td_TB <= "1001";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010010111";
        td_TB <= "1010";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010010110";
        td_TB <= "1011";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010010101";
        td_TB <= "1100";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010010100";
        td_TB <= "1101";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010010011";
        td_TB <= "1110";

        wait until clk_TB'event and clk_TB = '1';
        data_in_TB <= "00000001010001011111110010010010";
        td_TB <= "1111";
        
--Select registers

        wait until clk_TB'event and clk_TB = '1';
        td_TB <= "0000";
        dr_TB <= "00100";
        sa_TB <= "01001"; --> A = 0145FCB7
        sb_TB <= "10011"; --> B = 0145FCAD
        fs_TB <= "00000";
        mb_TB <= '0';
        md_TB <= '0';
        
--Perform Datapath operations on A and B (Register 9 and Register 19),
--storing result in DR (Register 4)

        -- F = A + NOT(B) + 1 = 0145FCB7 + FEBA0352 + 1 = 0000000A
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00101";
        
        -- F = NOT(A) = NOT(0145FCB7) = FEBA0348
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01110";
        
        -- F = A + NOT(B) = 0145FCB7 + FEBA0352 = 00000009
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00100";
        
        -- F = A = 0145FCB7 [FS = 00111]
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00111";
        
        -- F = A + B + 1 = 0145FCB7 + 0145FCAD + 1 = 028BF965
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00011";
        
        -- F = B>> = LSR(0145FCAD) = 00A2FE56
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "10100";
        
        -- F = A + B = 0145FCB7 + 0145FCAD = 028BF964
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00010";
        
        -- F = B<< = LSL(0145FCAD) = 028BF95A
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "11000";
        
        -- F = A = 0145FCB7 [FS = 00000]
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00000";
        
        -- F = B = 0145FCAD
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "10000";
        
        -- F = A + 1 = 0145FCB7 + 1 = 0145FCB8
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00001";
        
        -- F = A XOR B = 0145FCB7 XOR 0145FCAD = 0000001A
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01100";
        
        -- F = A OR B = 0145FCB7 OR 0145FCAD = 0145FCBF
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01010";
        
        -- F = A - 1 = 0145FCB7 - 1 = 0145FCB6
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00110";
        
        -- F = A AND B = 0145FCB7 AND 0145FCAD = 0145FCA5
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01000";
        
--Perform Datapath operations on A and B (Register 9 and Student ID),
--storing result in DR (Register 4)
        
        -- F = A + NOT(B) + 1 = 0145FCB7 + FEBA033F + 1 = FFFFFFF7
        wait until clk_TB'event and clk_TB = '1';
        ir_in_TB <= "00000001010001011111110011000000";
        mb_TB <= '1';
        fs_TB <= "00101";
        
        -- F = A + NOT(B) = 0145FCB7 + FEBA033F = FFFFFFF6
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00100";
        
        -- F = A + B + 1 = 0145FCB7 + 0145FCC0 + 1 = 028BF978
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00011";
        
        -- F = B>> = LSR(0145FCC0) = 00A2FE60
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "10100";
        
        -- F = A + B = 0145FCB7 + 0145FCC0 = 028BF977
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "00010";
        
        -- F = B<< = LSL(0145FCC0) = 028BF980
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "11000";
        
        -- F = B = 0145FCC0
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "10000";
        
        -- F = A XOR B = 0145FCB7 XOR 0145FCC0 = 00000077
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01100";
        
        -- F = A OR B = 0145FCB7 OR 0145FCC0 = 0145FCF7
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01010";
        
        -- F = A AND B = 0145FCB7 AND 0145FCC0 = 0145FC80
        wait until clk_TB'event and clk_TB = '1';
        fs_TB <= "01000";
    
    end process;

end Sim;
