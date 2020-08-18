--------------------------------------------
-- Module Name: calc_even_parity_procedure
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity calc_even_parity_procedure  Is Port (
	Signal ain : in STD_LOGIC_VECTOR (7 downto 0);
	Signal parity : out STD_LOGIC
);
end calc_even_parity_procedure ;



Architecture behavior of calc_even_parity_procedure  Is

    procedure calc_even_parity (
        signal input : in STD_LOGIC_VECTOR (7 downto 0);
        signal output : out std_logic 
    ) is 
    variable par_bit : STD_LOGIC := '0';
    begin
        for k in 0 to input'length-1 loop
            par_bit := par_bit xor ain(k);
        end loop;
        output <= par_bit;
    end calc_even_parity;
    
begin 

    calc_even_parity(ain, parity);

end behavior;