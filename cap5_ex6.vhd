library ieee;
use ieee.std_logic_1164.all;

entity cap5_ex6 is
	generic (N : natural := 40 );
	port
	(
		g  : buffer std_logic_vector(N-1 downto 0);
		b  : buffer std_logic_vector(N-1 downto 0)
	 );
end entity;

architecture bin2gray of cap5_ex6 is

begin
	g(N - 1) <= b (N - 1);
	
	gen: 
	for i in 0 to N-2 generate
		g(i) <= b(i) xor b(i+1);
	end generate;
	
end architecture;

architecture gray2bin of cap5_ex6 is
begin
	b(N - 1) <= g (N - 1);
	
	gen: 
	for i in 0 to N-2 generate
		b(i) <= g(i) xor g(i+1);
	end generate;

end architecture;

configuration cap5_ex6_cf of cap5_ex6 is
	 for bin2gray end for;
	--for gray2bin end for;
end configuration;