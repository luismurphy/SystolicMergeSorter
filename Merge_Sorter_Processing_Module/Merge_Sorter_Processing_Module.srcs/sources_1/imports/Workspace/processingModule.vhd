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
    signal regS : std_logic_vector(7 downto 0):="00000001";
    signal regB : std_logic_vector(7 downto 0):="00000010";
    signal ready, ready2 : std_logic := '0';

-- FUNCTIONAL CODE: module functionality and implementation
begin
	process --change process(rising_edge(clk)) to process(clk)
	variable count : integer := 1;
	begin 
        if(rising_edge(clk)) then  --added this if
            if(regS < IL and IL <= regB and regB <= IR) then
              report "Case 2";
              regS <= IL;
            elsif (regB < IL and regB <= IR) then
                report "Case 3";
              regS <= regB; regB <= IL; --change Rb for regB in regS<=regB
            elsif (IL <= regS and regS <= IR and IR < regB) then
              report "Case 4";
              regB <= IR;
            elsif (IL <= regS and IR < regS) then
              report "Case 5";
              regS <= IR; regB <= regS;
            elsif (regS < IL and IL <= IR and IR < regB) then
              report "Case 6";
              regS <= IL;regB <= IR;
            elsif(regS <= IR and IR < IL and IR < regB) then
              report "Case 7";
              regS <= IR;regB <= IL;
            end if;
            ready <= '1';
            wait until ready = '1';
                RS <= regS;
                RB <= regB;
                count := count+1;
                ready <= '0';
        end if;
    
        -- FOR TESTING PURPOSES ONLY!!
        --if(falling_edge(clk)) then
        --    if (count = 2) then -- case 2 
        --        regS <= "00000000";
        --        regB <= "00000010";
        --    elsif (count = 3) then -- case 3
        --        regS <= "00000111";
        --        regB <= "00000000";
        --    elsif (count = 4) then -- case 4
        --        regS <= "00000001";
        --        regB <= "00000011";
        --    elsif (count = 5) then -- case 5
        --        regS <= "00000010";
        --        regB <= "00000111";
        --    elsif (count = 6) then -- case 6
        --        regS <= "00000000";
        --        regB <= "00000011";
        --    elsif (count >= 7) then -- case 7
        --        regS <= "00000000";
        --        regB <= "00000011";
        --    end if;
        --    ready2 <= '1';
        --    wait until ready2 = '1';
        --        RS<= regS;
        --        RB<= regB;
        --        ready2 <= '0';
        --end if;
        wait on clk;
	end process;
	

end Behavioral;