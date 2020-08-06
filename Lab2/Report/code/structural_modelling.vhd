library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twobitmux is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0));  -- Was left as in, had to change to output.
end twobitmux;

architecture Behavioral of twobitmux is
		
	-- Declare Signals to store intermediary Stages
	Signal a_int0 : STD_LOGIC; 
	Signal a_int1 : STD_LOGIC;
	Signal a_int2 : STD_LOGIC; 
	Signal a_int3 : STD_LOGIC;
	signal not_s : STD_LOGIC;

	-- Declare all primitive gates to use

	Component and2
		port (
			i0, i1 : in STD_LOGIC;
			O : out STD_LOGIC 
		);
	end component;

	component or2
		port (
			i0, i1 : in STD_LOGIC;
			O : out STD_LOGIC
		);
	end component;

	component inv
		port (
			i : in STD_LOGIC;
			O : out STD_LOGIC
		);
	end component;

	begin
		
		NOT_COMP : inv port map (
			i => s,
			O => not_s
		);
		
		AND_COMP0 : and2 port map (
			i0 => x(0),
			i1 => not_s,
			O  => a_int0
		);
		AND_COMP1 : and2 port map (
			i0 => y(0),
			i1 => s,
			O  => a_int1    
		);
		OR_COMP1 : or2 port map (
			i0 => a_int0,
			i1 => a_int1,
			O  => m(0)
		);
		
		
		AND_COMP2 : and2 port map (
			i0 => x(1),
			i1 => not_s,
			O  => a_int2
		);
		AND_COMP3 : and2 port map (
			i0 => y(1),
			i1 => s,
			O  => a_int3    
		);
		OR_COMP2 : or2 port map (
			i0 => a_int2,
			i1 => a_int3,
			O  => m(1)
		);
		
end Behavioral;
