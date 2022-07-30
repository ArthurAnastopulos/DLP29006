library ieee;
use ieee.std_logic_1164.all;

entity cap5_ex7 is
	generic
	(
		N : integer := 8
	);
	
	port
	(
		x : in std_logic_vector (N-1 downto 0);
		y : out natural range 0 to N
	);
end entity;

architecture hamming_weight of cap5_ex7 is
	type arr is array (0 to N) of natural range 0 to N;
	signal aux : arr;
begin
	aux(0) <= 0;
	gen:
	for i in 1 to N generate
		aux(i) <= (aux(i-1) + 1) when ( x(i-1) = '1'  ) else aux(i-1);
	end generate;
	
	y <= aux(N);
	
end architecture;