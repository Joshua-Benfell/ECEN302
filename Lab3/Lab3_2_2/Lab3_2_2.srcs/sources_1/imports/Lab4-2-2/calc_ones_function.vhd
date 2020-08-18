--------------------------------------------
-- Module Name: calc_ones_function
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity calc_ones_function  Is Port (
	Signal ain : in STD_LOGIC_VECTOR (7 downto 0);
	Signal number_of_ones : out STD_LOGIC_VECTOR (2 downto 0)
);
end calc_ones_function ;

Architecture behavior of calc_ones_function  Is
		
	function count_ones(
	    signal input : std_logic_vector (7 downto 0)
	)
	return std_logic_vector is
	   variable count : std_logic_vector (2 downto 0) := "000";
	begin 
	   for k in 0 to input'length-1 loop
	       if (input(k) = '1') then
	          count := count + 1;
	       end if;
	   end loop;
	return count;
	end count_ones;
	   
		
begin	
    number_of_ones <= count_ones(ain);


end behavior;