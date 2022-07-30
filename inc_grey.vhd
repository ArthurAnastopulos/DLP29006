library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inc_grey is
	generic
	(
		N : natural := 8
	);
	
	port
	(
		gray_in : in std_logic_vector(N-1 downto 0);
		gray_out : out std_logic_vector(N-1 downto 0)
	);
end entity;

architecture inc_grey of inc_grey is
	signal aux_bin : std_logic_vector(N-1 downto 0);
	signal sum : std_logic_vector(N-1 downto 0);
begin
	-- Conversor para bin para poder incrementar
	aux_bin(N-1) <= gray_in(N-1) xor '0';
	
	conversor: 
	for i in 0 to N-2 generate
		aux_bin(i) <= gray_in(i) xor aux_bin(i+1);
	end generate;

	sum <= std_logic_vector(unsigned(aux_bin) + 1); -- incrementa
	
	-- Converte de volta para grey
	gray_out(N-1) <= sum(N-1) xor '0';
	
	conversor2: 
	for i in 0 to N-2 generate
		gray_out(i) <= sum(i) xor sum(i+1);
	end generate;
	
end architecture;