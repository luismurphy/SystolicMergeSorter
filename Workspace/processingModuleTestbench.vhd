LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
USE ieee.math_real.ALL;
use IEEE.NUMERIC_STD.all;

entity processing_module_tb is
end processing_module_tb;


-- ARCHITECTURE BLOCK --
architecture Behavioral of processing_module_tb is

--Signal declarations
signal S_CLK : std_logic :='0';
signal S_IL : std_logic_vector(7 downto 0) := "00000000";
signal S_IR : std_logic_vector(7 downto 0) := "00000000";
signal S_RS : std_logic_vector(7 downto 0);
signal S_RB : std_logic_vector(7 downto 0);
constant clk_period : time := 1 ns;


-- Component declarations
component processing_module port (
	IL : in std_logic_vector(7 downto 0); 
	IR : in std_logic_vector(7 downto 0);
	RS : out std_logic_vector(7 downto 0); 
	RB : out std_logic_vector(7 downto 0);
	clk : in std_logic
);
end component;



-- functional code
begin
	uut: processing_module PORT MAP ( S_IL, S_IR, S_RS, S_RB, S_CLK ); 
	
	     
	clk_process : process
	begin
		S_CLK <= '0';
		wait for clk_period/2;  --for 0.5 ns signal is '0'.
		S_CLK <= '1';
		wait for clk_period/2;  --for next 0.5 ns signal is '1'.
	end process;

	process(S_CLK)
        variable seed1, seed2: positive;
        variable rand_num : integer := 0;
        variable rand: real;
        variable range_of_rand : real := 255.0;
        variable stim: std_logic_vector(7 DOWNTO 0);
    begin
        if (falling_edge(S_CLK)) then
            uniform(seed1, seed2, rand);
            rand_num := integer(rand*range_of_rand);
            stim := std_logic_vector(to_unsigned(rand_num, stim'LENGTH));
            S_IL <= stim;
            
--            uniform(seed1, seed2, rand);
--            rand_num := integer(rand*range_of_rand);
--            stim := std_logic_vector(to_unsigned(rand_num, stim'LENGTH));
--            S_IR <= stim;
		end if;
	end process;

end Behavioral;