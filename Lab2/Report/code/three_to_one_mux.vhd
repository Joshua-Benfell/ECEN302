library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity three_to_one_mux is
    Port ( u : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           w : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
		   m : out STD_LOGIC_VECTOR (1 downto 0)
		);
end three_to_one_mux;

architecture Behavioral of three_to_one_mux is

	component twobitmux  -- Register a two bit mux module from one of the previous sections
		port ( 
			x : in STD_LOGIC_VECTOR (1 downto 0);
			y : in STD_LOGIC_VECTOR (1 downto 0);
			s : in STD_LOGIC;
			m : out STD_LOGIC_VECTOR (1 downto 0)
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
