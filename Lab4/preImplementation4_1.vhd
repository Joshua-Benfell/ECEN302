----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2020 10:32:50 AM
-- Design Name: 
-- Module Name: Mealy_FSM_Mod_Three - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mealy_FSM_Mod_Three is
    Port ( ain : in STD_LOGIC;
           yout : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           count : out STD_Logic_vector (3 downto 0) := "0000");
end Mealy_FSM_Mod_Three;

architecture Behavioral of Mealy_FSM_Mod_Three is

type state_type is (S0, S1, S2);
signal state, next_state : state_type;  -- Define signals for the states
signal counter : unsigned (3 downto 0) := "0000";

begin

SYNC_PROC : process (clk)
begin
    if rising_edge(clk) then
        if (reset = '1') then
            state <= S0;
            counter <= "0000";
        else
            state <= next_state;
        end if;
        
        if (ain = '1') then
            counter <= counter + 1;
        end if;
    end if;
end process;

OUTPUT_DECODE : process(state, ain)
begin
    case (state) is
        when S0 =>
            if (ain = '1') then
                yout <= '1';
            else
                yout <= '0';
            end if;
        when others =>
            yout <= '0';
    end case;
end process;

NEXT_STATE_DECODE : process (state, ain)
begin
    next_state <= S0;
    case (state) is
        when S0 => 
            if (ain = '1') then
                next_state <= S1;
            else
                next_state <= S0;
            end if;
        when S1 =>
            if (ain = '1') then
                next_state <= S2;
            else
                next_state <= S1;
            end if;
        when S2 => 
            if (ain = '1') then
                next_state <= S0;
            else
                next_state <= S2;
            end if;
        end case;
end process;

count <= std_logic_vector (counter);

end Behavioral;
