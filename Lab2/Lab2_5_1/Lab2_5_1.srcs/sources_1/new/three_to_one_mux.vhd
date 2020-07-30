----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/30/2020 12:33:40 PM
-- Design Name: 
-- Module Name: three_to_one_mux - Behavioral
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

entity three_to_one_mux is
    Port ( u : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           w : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           m : out STD_LOGIC_VECTOR (1 downto 0));
end three_to_one_mux;

architecture Behavioral of three_to_one_mux is

component twobitmux
    port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0)  -- Was left as in, had to change to output. 
    );
end component;
signal mux_out : std_logic_vector (1 downto 0);


begin
    MUX1 : twobitmux port map (
        x => u,
        y => y,
        s => s(0),
        m => mux_out
    );
    
    MUX2 : twobitmux port map (
        x => w,
        y => mux_out,
        s => s(1),
        m => m
    );

end Behavioral;
