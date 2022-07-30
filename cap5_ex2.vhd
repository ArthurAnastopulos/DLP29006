library ieee;
use ieee.std_logic_1164.all;

entity cap5_ex2 is
	port
	(
		d, clk, rst : in std_logic;
		q : out std_logic
	);
end entity;

architecture flip_flop_concurrent of cap5_ex2 is
begin
	q <= '0' when rst = '1' else
			d  when clk'event and clk='1';
end architecture;

architecture dual_edge_ff of cap5_ex2 is
	signal q1, q2 : std_logic;
begin
	q1 <= d when ( clk = '1') else q1;
	q2 <= d when ( clk='0' ) else q2;
	q <= q1 when ( clk='0') else q2;
end architecture;

configuration cap5_ex2_cf of cap5_ex2 is
	--for flip_flop_concurrent end for;
	for dual_edge_ff end for;
end configuration;
