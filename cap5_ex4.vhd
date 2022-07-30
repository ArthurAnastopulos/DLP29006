library ieee;
use ieee.std_logic_1164.all;

entity cap5_ex4 is
	generic
	(
		N: integer := 8
	);
	
	port
	(
		x : in std_logic_vector(N-1 downto 0);
		y: out std_logic_vector(N downto 0)
	);
end entity;

architecture parity_generator of cap5_ex4 is
	signal aux: std_logic_vector(N-1 downto 0);
begin
	aux(0) <= x(0);
	
	par_gen:
	for i in 1 to N-1 generate
		aux(i) <= aux(i-1) xor x(i);
	end generate;
	
	y <= aux(N-1) & x; -- & concat
end architecture;