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
    Port ( IL : in STD_LOGIC;
           IR : in STD_LOGIC;
           RS : out STD_LOGIC;
           RB : out STD_LOGIC;
           clk : in STD_LOGIC);
end Array8;

architecture Behavioral of Array8 is
component processing_module
Port(IL : in std_logic_vector(7 downto 0); 
	IR : in std_logic_vector(7 downto 0);
	RS : out std_logic_vector(7 downto 0); 
	RB : out std_logic_vector(7 downto 0);
	clk : in std_logic
	);
	end component;
	signal c: std_logic_vector(7 downto 0);
	
begin
g1: For i in 0 to 7 generate
comp: processing_module
port map(
IL=>R(i),
IR=>RS(i+1),
RS=>RS(i),
RB=>RB(i),
clk=>clk(i));
end generate g1;


end Behavioral;
