library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port ( 
           clk : in STD_LOGIC;
           direction : in STD_LOGIC;
           count_out : out STD_LOGIC_VECTOR (3 downto 0);
           Seg_Out : out STD_LOGIC_VECTOR (6 downto 0)  
         );
end counter;

architecture Behavioral of counter is

-- PART 1
--signal count_int : unsigned(3 downto 0) := (others => '0');
-- END PART 1
-- PART 2
signal count_int : unsigned(27 downto 0) := (others => '0');  -- make it 28 bits long
-- END PART 2

--PART 3
Component ssd_decoder is  -- This registers the entity ssd_decoder in this project.
    Port ( 
           Bin : in STD_LOGIC_VECTOR (3 downto 0);
           Seg_Out : out STD_LOGIC_VECTOR (6 downto 0)
          );
end Component;
-- END PART 3


begin

process (clk)  -- Forces Sequential Operation
begin
   if clk='1' and clk'event then
      if direction='1' then  -- Comparison with char?
         count_int <= count_int + 1; -- Push count_int + 1 into count_int
      else
         count_int <= count_int - 1;
      end if;
   end if;
end process;

-- PART 1
-- count_out <= std_logic_vector(count_int);  -- Type cast from unsigned to std_logic_vector
-- END PART 1
-- PART 2
count_out <= std_logic_vector(count_int(27 downto 24)); -- Select 4MSBs of the 28 bit long thing
-- END PART 2

-- PART 3
ssd: ssd_decoder PORT MAP (
    Bin => std_logic_vector(count_int(27 downto 24)),
    Seg_Out => Seg_Out
);
-- END PART 3

end Behavioral;
