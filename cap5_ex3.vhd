library ieee;
use ieee.std_logic_1164.all;

entity cap5_ex3 is
	generic
	(
		N	: Natural  :=	8
	);
	port
	(
		a	: in  std_logic_vector (N-1 downto 0);
		y	: out std_logic
	);
end entity;

architecture andN of cap5_ex3 is
	signal aux : std_logic_vector(N downto 1);
begin

	aux(1) <= a(0);
	
	andCascata: 
	for k in 1 to N-1 generate
		aux(k+1) <= aux(k) and a (k);
	end generate;

	y <= aux(N);

end architecture;

architecture nandN of cap5_ex3 is
	signal aux: std_logic_vector(N downto 1);
begin
	aux(1) <= a(0);
	
	andCascata:
	for i in 1 to N-1 generate
		aux(i+1) <= aux(i) and a(i);
	end generate;

	y <= not aux(N);
	
end architecture;

configuration cap5_ex3_cf of cap5_ex3 is
	--for andN end for;
	for nandN end for;
end configuration;