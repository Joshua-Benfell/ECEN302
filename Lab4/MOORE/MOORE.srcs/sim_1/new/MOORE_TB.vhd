----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2020 04:09:53 PM
-- Design Name: 
-- Module Name: MOORE_TB - Behavioral
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

entity MOORE_TB is
--  Port ( );
end MOORE_TB;

architecture Behavioral of MOORE_TB is
    
    component MOORE_FSM
    Port ( ain : in STD_LOGIC_VECTOR (1 downto 0);
           yout : out STD_LOGIC;
           clk : in STD_LOGIC);
    end component;
    
    signal ain_int  : std_logic_vector (1 downto 0) := "00";
    signal yout_int : std_logic := '0';
    signal clk_int  : std_logic := '0';
    
begin
    uut: MOORE_FSM PORT MAP (
        ain => ain_int,
        yout => yout_int,
        clk => clk_int
    );

    clk_int <= not clk_int after 5ns;
    
    process
    begin
        wait for 20ns;
        ain_int <= "11";
        wait for 10ns;
        ain_int <="10";
        wait for 10ns;
        ain_int <= "00";
        wait for 20ns;
        ain_int <= "10";
        wait for 10ns;
        ain_int <= "00";
        wait for 10ns;
        ain_int <= "11";
        wait for 10ns;
        ain_int <= "00";
        wait for 10ns;
        ain_int <= "01";
        wait for 10ns;
        ain_int <= "00";
        wait for 10ns;
        ain_int <= "10";
        wait for 10ns;
        ain_int <= "11";
        wait for 10ns;
        ain_int <= "00";
        wait for 60ns;
        
    end process;

end Behavioral;
