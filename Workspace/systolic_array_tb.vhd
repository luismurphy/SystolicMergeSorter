LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

-- ENTITY BLOCK --
entity systolic_array_tb is
end systolic_array_tb;


-- ARCHITECTURE BLOCK --
architecture Behavioral of systolic_array_tb is

--Signal declarations
signal S_CLK : std_logic := '0';
-- Initialize according to first case you want to test
signal S_HEAD_IN : std_logic_vector(7 downto 0) := "00000001";
signal S_TAIL_IN : std_logic_vector(7 downto 0) := "00000000";
signal S_HEAD_OUT : std_logic_vector(7 downto 0);
constant CLK_PERIOD : time := 1 ns;


-- Component declarations
component Array8 port (
	HEAD_IN : in std_logic_vector(7 downto 0);
    TAIL_IN : in std_logic_vector(7 downto 0);
    HEAD_OUT : out std_logic_vector(7 downto 0);
    CLK : in std_logic
);
end component;



-- functional code
begin
	uut: Array8 port map ( S_HEAD_IN, S_TAIL_IN, S_HEAD_OUT, S_CLK ); 
	
	CLK_PROCESS : process
	begin
		S_CLK <= '0';
		wait for CLK_PERIOD/2;  --for 0.5 ns signal is '0'.
		S_CLK <= '1';
		wait for CLK_PERIOD/2;  --for next 0.5 ns signal is '1'.
	end process;

	process(S_CLK)
	variable count : integer := 1;
    begin
        if (rising_edge(S_CLK)) then
            count := count + 1;
        end if;
        if (falling_edge(S_CLK)) then
            --Here, insert for next cases
            if (count = 2)  then -- case 2
                S_HEAD_IN <= "00001100";
            elsif (count = 3) then -- case 3
                S_HEAD_IN <= "00001000";
            elsif (count = 4) then -- case 4
                S_HEAD_IN <= "00000100";
            elsif (count = 5) then -- case 5
                S_HEAD_IN <= "00001110";
            elsif (count = 6) then -- case 6
                S_HEAD_IN <= "00001000";
            elsif (count = 7) then -- case 7
                S_HEAD_IN <= "00001001";
            elsif (count >= 8) then -- case 8
                S_HEAD_IN <= "00001001";
            end if;
		end if;
	end process;

end Behavioral;	