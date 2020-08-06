library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcdto7segment_dataflow is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg_out : out STD_LOGIC_VECTOR (6 downto 0));
end bcdto7segment_dataflow;

architecture Behavioral of bcdto7segment_dataflow is

begin
    an <= "11111110";
    with x select
    seg_out <= "1000000" when "0000",  -- 0
               "1111001" when "0001",  -- 1
               "0100100" when "0010",  -- 2
               "0110000" when "0011",  -- 3
               "0011001" when "0100",  -- 4
               "0010010" when "0101",  -- 5
               "0000010" when "0110",  -- 6
               "1111000" when "0111",  -- 7
               "0000000" when "1000",  -- 8
               "0010000" when "1001",  -- 9
               "1111111" when others;
end Behavioral;
