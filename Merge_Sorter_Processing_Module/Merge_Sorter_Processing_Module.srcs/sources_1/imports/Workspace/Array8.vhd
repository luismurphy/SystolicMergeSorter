
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Array8 is
    Port ( head_in : in STD_LOGIC_VECTOR(7 downto 0);
           tail_in : in STD_LOGIC_VECTOR(7 downto 0);
           head_out : out STD_LOGIC_VECTOR(7 downto 0);
           clk : in STD_LOGIC);
end Array8;

architecture Behavioral of Array8 is

    -- DECLARE
    component processing_module
    Port(IL : in std_logic_vector(7 downto 0); 
        IR : in std_logic_vector(7 downto 0);
        RS : out std_logic_vector(7 downto 0); 
        RB : out std_logic_vector(7 downto 0);
        clk : in std_logic
        );
    end component;
    
    type vector_array is array (0 to 7) of std_logic_vector(7 downto 0);
    signal left_data : vector_array;
    signal right_data : vector_array;
    
    -- INSTANTIATE
    begin
    pm_array: For i in 0 to 7 generate
        pm1: if i=0 generate
        begin
            pm: component processing_module
                port map(head_in, left_data(i+1), head_out, right_data(i), clk);
                --       IL        IR               RS          RB
        end generate pm1;
        
        pm_middle: if (i>0 AND i<7) generate
        begin
            pm: component processing_module
                port map(right_data(i-1), left_data(i+1), left_data(i), right_data(i), clk);
        end generate pm_middle;
        
        pm7: if (i=7) generate
        begin
            pm: component processing_module
                port map(right_data(i-1), tail_in, left_data(i), right_data(i), clk);
        end generate pm7;
        
    end generate pm_array;
end Behavioral;
