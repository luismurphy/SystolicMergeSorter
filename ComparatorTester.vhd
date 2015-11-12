----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2015 01:44:59 PM
-- Design Name: 
-- Module Name: ComparatorTester - Behavioral
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

entity ComparatorTester is
    Port ( a : in STD_LOGIC_vector(7 downto 0);
           b : in STD_LOGIC_vector(7 downto 0);
           alb : out STD_LOGIC;
           agb : out STD_LOGIC;
           aeb : out STD_LOGIC);
end ComparatorTester;

architecture Behavioral of ComparatorTester is
    Signal result : std_logic_vector(2 downto 0);
begin
    Process (a,b)
    begin
        if a<b then
        result <= "001";
        elsif a=b then
                result <= "010";
        elsif a>b then
        result <= "100";
        else result <= "000";
        
        end if;
        agb <= result(2);
        aeb <= result(1);
        alb <= result(0);
    end process;
end Behavioral;
