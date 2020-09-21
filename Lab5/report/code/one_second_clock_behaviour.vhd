----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2019 13:30:19
-- Design Name: 
-- Module Name: one_second_clock_behaviour - Behavioural
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
use IEEE.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity one_second_clock_behaviour is
    Port ( mclk : in STD_LOGIC; -- Master Clock 100MHz
           reset : in STD_LOGIC;  -- Reset Bit BTNU
           enable : in STD_LOGIC;  -- Enable Input SW0
           clk_out : out STD_LOGIC;  -- Output LED LD0
           lock : out STD_LOGIC;  -- MMCM Lock Output SW15. High when enable is low.
           segmentOut: out STD_LOGIC_VECTOR(6 downto 0);
           segmentEnable: out STD_LOGIC_VECTOR(7 downto 0));
end one_second_clock_behaviour;

architecture Behavioural of one_second_clock_behaviour is

component clk_5MHz
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

COMPONENT c_counter_binary_0
  PORT (
    CLK : IN STD_LOGIC;
    CE : IN STD_LOGIC;
    SCLR : IN STD_LOGIC;
    THRESH0 : OUT STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

component ssd_decoder
port
 ( clk : in STD_LOGIC;
   in_0 : in STD_LOGIC_VECTOR (3 downto 0);
   in_1 : in STD_LOGIC_VECTOR(3 downto 0);
   Seg_Out : out STD_LOGIC_VECTOR (6 downto 0);
   Seg_enable : out STD_LOGIC_VECTOR(7 downto 0)
 );
end component;
    

signal counter : integer := 0;
signal clk_1Hz : STD_Logic := '0';
signal clk5_out: STD_LOGIC;
signal clk500: std_logic;
signal threshold :std_LOGIC;

signal num0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal num1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";


signal segOut : STD_LOGIC_VECTOR(6 downto 0);
signal segEn : STD_LOGIC_VECTOR(7 downto 0);

signal flipOver : std_logic := '0';


begin

clk5 : clk_5MHz
   port map ( 
      -- Clock out ports  
       clk_out1 => clk5_out,
      -- Status and control signals                
       reset => '0',
       locked => lock,
       -- Clock in ports
       clk_in1 => mclk
    );
 
 ssd : ssd_decoder 
    port map (
        clk => clk500,
        in_0 => num0,
        in_1 => num1,
        Seg_Out => segmentOut,
        Seg_enable => segmentEnable
    );

Counter0 : c_counter_binary_0
  PORT MAP (
    CLK => clk_1Hz,
    CE => '1',
    SCLR => reset,
    THRESH0 => threshold,
    Q => num0
  );
  
Counter1 : c_counter_binary_0
    PORT MAP (
        CLK => clk_1Hz,
        CE => threshold,
        SCLR => reset,
        THRESH0 => open,
        Q => num1
    );


clock_divider: process (clk5_out)
begin  
    if (clk5_out'event and clk5_out='1') then  -- Count to 5 million
        counter <= counter + 1;
        if (counter = 2500000) then  -- Once we hit 5 million toggle the 1 Hz clock
            if (enable = '1') then
                clk_1Hz <= not clk_1Hz;
            end if;
            counter <= 0;
        end if;
        if(counter mod 500 = 0) then
            clk500 <= not clk500;
        end if;
        
        if (enable = '1') then
            clk_out <= clk_1Hz;  -- Set LD0 to the state of the 1Hz Clock
        end if; 
        
        
    end if;
end process;

flipOver <= not threshold;  --  Makes the switch happen on the falling edge

end Behavioural;
