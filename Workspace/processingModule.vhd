-- ENTITY DECLARATION: module input and output ports of a device
-- port names, port sizes, directions

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processing_module is port( 
	IL : in std_logic_vector(7 downto 0); 
	IR : in std_logic_vector(7 downto 0);
	RS : out std_logic_vector(7 downto 0); 
	RB : out std_logic_vector(7 downto 0);
	clk : in std_logic
	);
end processing_module;


-- ARCHITECTURE BLOCK
architecture Behavioral of processing_module is
    signal regS : std_logic_vector(7 downto 0):="00000000";
    signal regB : std_logic_vector(7 downto 0):="00000000";

-- FUNCTIONAL CODE: module functionality and implementation
begin
	process(clk) --change process(rising_edge(clk)) to process(clk)
	begin 
	if(rising_edge(clk)) then  --added this if
		if(regS < IL and IL <= regB and regB <= IR) then
			regS <= IL;
		elsif (regB < IL and regB <= IR) then
			regS <= regB; regB <= IL; --change Rb for regB in regS<=regB
		elsif (IL <= regS and regS <= IR and IR < regB) then
			regB <= IR;
		elsif (IL <= regS and IR < regS) then
			regS <= IR; regB <= regS;
		elsif (regS < IL and IL <= IR and IR < regB) then
			regS <= IL;regB <= IR;
		elsif(regS <= IR and IR < IL and IR < regB) then
			regS <= IR;regB <= IL;
		end if;
	end if;
		RS <= regS;
		RB <= regB;
	end process;
end Behavioral;