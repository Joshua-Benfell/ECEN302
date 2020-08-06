library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           s : in STD_LOGIC;
           m : out STD_LOGIC);
end MUX;

architecture Behavioral of MUX is
begin
    
    process (x, y, s)
        begin
            if(s='0') then
                m <= y;
            else
                m <= x;
            end if;
    end process;
end Behavioral;
