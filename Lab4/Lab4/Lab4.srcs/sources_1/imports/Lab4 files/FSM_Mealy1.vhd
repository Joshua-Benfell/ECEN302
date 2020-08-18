----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2019 03:53:39 PM
-- Design Name: 
-- Module Name: FSM_Mealy1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_Mealy1 is
    Port ( x : in STD_LOGIC; clk : in STD_LOGIC; Reset : in STD_LOGIC;
           parity : out STD_LOGIC);
end FSM_Mealy1;

architecture Behavioral of FSM_Mealy1 is

type state_type is (S0, S1);
signal state, next_state : state_type;

begin

SYNC_PROC : process (clk)
begin
    if rising_edge(clk) then 
            if (reset = '1') then
                  state <= S0;
            else
                  state <= next_state;
            end if;
      end if;
end process;

OUTPUT_DECODE : process (state, x)
begin 
      parity <= '0';
      case (state) is
            when S0 =>
                  if (x = '1') then
                        parity <= '1';
                  end if;
            when S1 =>
                  if (x = '0') then
                        parity <= '1';
                  end if;
            when others =>
                  parity <= '0';
            end case;
end process;

NEXT_STATE_DECODE : process (state, x) 
begin
      next_state <= S0;
      case (state) is
            when S0 =>
                  if (x = '1') then
                        next_state <= S1;
                  end if;
            when S1 =>
                  if (x = '0') then
                        next_state <= S1;
                  end if;
            when others =>
                  next_state <= S0;
            end case;
end process;

end Behavioral;
