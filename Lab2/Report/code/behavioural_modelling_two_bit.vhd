library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0));
end MUX;

architecture Behavioral of MUX is
begin
    
    process (x, y, s)
        begin
            if(s='0') then  -- This is backwards to the previous exercises
                m <= y;
            else
                m <= x;
            end if;
    end process;
end Behavioral;
