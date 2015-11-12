-- ENTITY DECLARATION: module input and output ports of a device
-- port names, port sizes, directions
entity processing_module is port( 
	IL : in std_logic_vector(7 downto 0); 
	IR : in std_logic_vector(7 downto 0);
	RS : out std_logic_vector(7 downto 0); 
	RB : out std_logic_vector(7 downto 0);
	clock : in std_logic
	);


-- ARCHITECTURE BLOCK
architecture Behavioral of processing_module is

-- FUNCTIONAL CODE: module functionality and implementation
begin
	-- Processes: sequential operations at specific signals (behavioral)
	process(clock)
	begin 
		if(RS<IL<=RB<=IR) then
			RS <= IL;
		elsif (RB<IL && RB<=IR) then
			RS<= RB; RB<=IL;
		elsif (IL<=RS && RS<=IR<RB) then
			RB<=IR;
		elsif (IL<=RS && IR<RS) then
			RS<=IR; RB<=RS;
		elsif (RS<IL<=IR<RB) then
			RS<=IL;RB<=IR;
		elsif(RS<=IR<IL&&IR<RB) then
			RS<=IR;RB<=IL;
		end if
	end process
end Behavioral