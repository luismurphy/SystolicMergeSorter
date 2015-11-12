LIBRARY ieee;
USE ieee.math_real.ALL;
USE ieee.numeric_std.ALL;

entity processing_module_tb is
end processing_module_tb;


-- ARCHITECTURE BLOCK
architecture Behavioral of processing_module_tb is
-- Component and signal declaration
component processing_module port (
	IL : in std_logic_vector(7 downto 0); 
	IR : in std_logic_vector(7 downto 0);
	RS : out std_logic_vector(7 downto 0); 
	RB : out std_logic_vector(7 downto 0);
	clk : in std_logic
);
end component;

signal clk : std_logic :='0';
signal IL : std_logic_vector :='0';
signal IR : std_logic_vector :='0';
signal RS : std_logic_vector :='0';
signal RB : std_logic_vector(7 downto 0);
constant clk_period : time := 1 ns;

-- functional code
begin
	uut: processing_module PORT MAP (
         clk => clk,
         IL=>IL,
         IR=>IR,
         RS=>RS,
         RB=>RB
     );       
	clk_process : process
	begin
		clk <= '0';
		wait for clk_period/2;  --for 0.5 ns signal is '0'.
		clk <= '1';
		wait for clk_period/2;  --for next 0.5 ns signal is '1'.
	end process;

	input_process : process(falling_edge(clk))
	VARIABLE int_rand: integer;
	variable stim: std_logic_vector(7 DOWNTO 0);
	begin
		int_rand := INTEGER(TRUNC(rand*255.0));
		stim := std_logic_vector(to_unsigned(int_rand, stim'LENGTH));
		IL <= stim;
	end process;

end Behavioral;