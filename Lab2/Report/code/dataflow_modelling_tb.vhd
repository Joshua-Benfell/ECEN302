library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MUX_tb is
--  Port ( );
end MUX_tb;

architecture Behavioral of MUX_tb is

Component MUX
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           s : in STD_LOGIC;
           m : out STD_LOGIC);
end Component;

signal x : std_logic := '1';
signal y : std_logic := '0';
signal s : std_logic := '0';
signal m : std_logic := '0';



begin

uut: MUX PORT MAP(
    x => x,
    y => y,
    s => s,
    m => m
);

process begin
    s <= '1';
    wait for 200ns;
    s <= '0';
    wait for 200ns;
end process;

end Behavioral;
