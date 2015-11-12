-- ENTITY DECLARATION: module input and output ports of a device
-- port names, port sizes, directions
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
    signal regS : std_logic_vector(7 downto 0):='0';
    signal regB : std_logic_vector(7 downto 0):='0';

-- FUNCTIONAL CODE: module functionality and implementation
begin
	process(rising_edge(clk))
	begin 
		if(regS < IL and IL <= regB and regB <= IR) then
			regS <= IL;
		elsif (regB < IL and regB <= IR) then
			regS <= RB; regB <= IL;
		elsif (IL <= regS and regS <= IR and IR < regB) then
			regB <= IR;
		elsif (IL <= regS and IR < regS) then
			regS <= IR; regB <= regS;
		elsif (regS < IL and IL <= IR and IR < regB) then
			regS <= IL;regB <= IR;
		elsif(regS <= IR and IR < IL and IR < regB) then
			regS <= IR;regB <= IL;
		end if;
		RS <= regS;
		RB <= regB;
	end process;
end Behavioral;