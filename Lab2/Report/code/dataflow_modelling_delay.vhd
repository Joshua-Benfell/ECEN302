library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twobitmux is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0));  -- Was left as in, had to change to output.
end twobitmux;

architecture Behavioral of twobitmux is

begin
    m(1) <= (y(1) and s) or (x(1) and (not s)) after 3ns;
    m(0) <= (y(0) and s) or (x(0) and (not s)) after 3ns;

end Behavioral;
