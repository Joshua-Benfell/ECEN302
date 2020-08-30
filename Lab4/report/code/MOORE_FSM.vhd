library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MOORE_FSM is
    Port ( ain : in STD_LOGIC_VECTOR (1 downto 0);
           yout : out STD_LOGIC;
           clk : in STD_LOGIC);
end MOORE_FSM;

architecture Behavioral of MOORE_FSM is

type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8);
signal state, next_state : state_type;
signal output : std_logic := '0';

begin

    SYNC_PROC : process (clk)
    begin
        if rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    OUTPUT_DECODE : process (state)
    begin
        case (state) is
            when S0 =>
                output <= '0';
            when S7 =>
                output <= '0';
            when S8 =>
                output <= '1';
            when others =>
                output <= output;
        end case;
     end process;     
     
     yout <= output;      
     
    NEXT_STATE_DECODE : process (state, ain)
    begin
        next_state <= S0;
        case (state) is
            -- State 0
            when S0 =>
                if (ain = "01") then
                    next_state <= S1;
                elsif (ain = "10") then
                    next_state <= S2;
                elsif (ain = "11") then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if; 
            -- State 1
            when S1 =>
                if (ain = "01") then
                    next_state <= S1;
                elsif (ain = "10") then
                    next_state <= S2;
                elsif (ain = "11") then
                    next_state <= S3;
                else
                    next_state <= S7;
                end if; 
            -- State 2
            when S2 =>
                if (ain = "01") then
                    next_state <= S1;
                elsif (ain = "10") then
                    next_state <= S2;
                elsif (ain = "11") then
                    next_state <= S3;
                else
                    next_state <= S8;
                end if; 
            -- State 3
            when S3 =>
                if (ain = "01") then
                    next_state <= S1;
                elsif (ain = "10") then
                    next_state <= S2;
                elsif (ain = "11") then
                    next_state <= S3;
                else
                    next_state <= S8;
                end if;  
            -- State 4
            when S4 =>
                if (ain = "01") then
                    next_state <= S4;
                elsif (ain = "10") then
                    next_state <= S5;
                elsif (ain = "11") then
                    next_state <= S6;
                else
                    next_state <= S7;
                end if; 
            -- State 5
            when S5 =>
                if (ain = "01") then
                    next_state <= S4;
                elsif (ain = "10") then
                    next_state <= S5;
                elsif (ain = "11") then
                    next_state <= S6;
                else
                    next_state <= S7;
                end if; 
            -- State 6
            when S6 =>
                if (ain = "01") then
                    next_state <= S4;
                elsif (ain = "10") then
                    next_state <= S5;
                elsif (ain = "11") then
                    next_state <= S6;
                else
                    next_state <= S8;
                end if;
            -- State 7
            when S7 =>
                if (ain = "01") then
                    next_state <= S1;
                elsif (ain = "10") then
                    next_state <= S2;
                elsif (ain = "11") then
                    next_state <= S3;
                else
                    next_state <= S7;
                end if; 
            -- State 8
            when S8 =>
                if (ain = "01") then
                    next_state <= S4;
                elsif (ain = "10") then
                    next_state <= S5;
                elsif (ain = "11") then
                    next_state <= S6;
                else
                    next_state <= S8;
                end if;         
             when others =>
                next_state <= S0;                                                         
        end case;
    end process;

end Behavioral;
