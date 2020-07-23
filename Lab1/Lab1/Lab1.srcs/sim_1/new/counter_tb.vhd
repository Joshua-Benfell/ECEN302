----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2020 10:44:08 AM
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is

Component Counter
port(
    clk : in STD_LOGIC;
    direction : in std_logic;
    count_out : out std_logic_vector(3 downto 0)   
);
end Component;

signal clock : std_logic := '0';
signal dir : std_logic := '0';
signal count : std_logic_vector(3 downto 0) := "0000";

constant clock_period : time := 10ns;

begin

uut: counter PORT MAP (
    clk => clock,
    direction => dir,
    count_out => count
);

process
begin 
    dir <= '1';
    wait for 200ns;
    dir <= '0';
    wait for 200ns;
end process;


clock <= not clock after clock_period;

end Behavioral;
