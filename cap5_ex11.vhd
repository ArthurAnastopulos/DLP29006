library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cap5_ex11 is
	generic
	(
		N : natural := 4
	);
	
	port
	(
		a, b : in std_logic_vector(N-1 downto 0);
		cin: in std_logic;
		opcode : in std_logic_vector(2 downto 0);
		y: out std_logic_vector(N-1 downto 0);
		cout : out std_logic
	);
end entity;

architecture adder of cap5_ex11 is
	signal a_unsig, b_unsig : unsigned (N-1 downto 0);
	signal y_unsig : unsigned (N downto 0);
	signal a_sig, b_sig : signed(N-1 downto 0);
	signal y_sig : signed(N downto 0);
begin
	a_unsig <= unsigned(a);
	b_unsig <= unsigned(b);
	
	a_sig <= signed(a);
	b_sig <= signed(b);
	
	with opcode(1 downto 0) select
	y_unsig <= ('0' & a_unsig) + ('0' & b_unsig) when "00",
				  ('0' & b_unsig) - ('0' & b_unsig) when "01",
				  ('0' & b_unsig) - ('0' & a_unsig) when "10",
				  ('0' & a_unsig) + ('0' & b_unsig) + ('0' & cin) when others;
				  
	with opcode(1 downto 0) select
	y_sig <= (a_sig(N-1) & a_sig) + (b_sig(N-1) & b_sig) when "00",
				(a_sig(N-1) & a_sig) - (b_sig(N-1) & b_sig) when "01",
				- (a_sig(N-1) & a_sig) + (b_sig(N-1) & b_sig) when "10",
				(a_sig(N-1) & a_sig) + (b_sig(N-1) & b_sig) + ('0' & cin) when others;
				
	with opcode(2) select
	y <= std_logic_vector(y_unsig(N-1 downto 0)) when '0', 
		  std_logic_vector(y_sig(N-1 downto 0)) when others; 
	
	with opcode(2) select
	cout <= std_logic(y_unsig(N)) when '0', 
			  std_logic(y_sig(N)) when others; 
end architecture;