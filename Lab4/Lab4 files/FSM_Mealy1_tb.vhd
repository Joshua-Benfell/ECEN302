----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2019 04:19:23 PM
-- Design Name: 
-- Module Name: FSM_Mealy1_tb - Behavioral
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

entity FSM_Mealy1_tb is
--  Port ( );
end FSM_Mealy1_tb;

architecture Behavioral of FSM_Mealy1_tb is

component FSM_Mealy1
    Port ( x : in STD_LOGIC; clk : in STD_LOGIC; Reset : in STD_LOGIC;
           parity : out STD_LOGIC);
end component;

signal clock :std_logic := '0';
signal rst :std_logic := '0';
signal input :std_logic := '0';
constant clk_period : time := 10ns;


begin

uut: FSM_Mealy1 PORT MAP (
clk => clock,
Reset => rst,
x => input
);

process 
begin
    rst <= '1';
    wait for 100ns;
    rst <= '0';
    wait for 200ns;
    input <= '1';
    wait for 10ns;
    input <= '0';
    wait for 10ns;
    input <= '1';
    wait for 10ns;
    wait;
end process;

clock <= not clock after clk_period;

end Behavioral;
