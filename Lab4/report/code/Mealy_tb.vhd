library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mealy_tb is
--  Port ( );
end Mealy_tb;

architecture Behavioral of Mealy_tb is
    component Mealy_FSM_Mod_Three
    Port ( ain : in STD_LOGIC;
           yout : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           count : out std_logic_vector (3 downto 0)
         );
    end Component;
    
    signal clk_int      : std_logic := '0';
    Signal ain_int      : STD_LOGIC := '0';
    signal count_int    : std_logic_vector (3 downto 0) := "0000";
    signal yout_int     : std_logic := '0';
    signal reset_int    : std_logic := '0';
begin 
    uut: Mealy_FSM_Mod_Three port map (
        ain => ain_int,
        yout => yout_int,
        clk => clk_int,
        reset => reset_int,
        count => count_int
    );
    
    

   
    process
    begin
        reset_int <= '1';
        wait for 20ns;
        reset_int <= '0'; 
        wait for 20ns;
        ain_int <= '1';
        wait for 20ns;
        ain_int <= '0';
        wait for 60ns;
        ain_int <= '1';
        wait for 40ns;
        ain_int <= '0';
        wait for 40ns;
    end process;

    clk_int <= not clk_int after 5ns;
end Behavioral;
