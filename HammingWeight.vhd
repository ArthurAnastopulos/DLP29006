
--library ieee;

-- Commonly imported packages:

	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	--use ieee.std_logic_1164.all;

	-- SIGNED and UNSIGNED types, and relevant functions
	-- use ieee.numeric_std.all;
	
	entity HammingWeight is
	generic
	(
		n	: natural  :=	10

	);


	port
	(
		-- Input ports
		X	: in  bit_vector (0 to n - 1);
				
		-- Output ports
		cnt	: out natural range 0 to n

	);
end entity;


architecture arthur_v1 of HammingWeight is

--	type int_vec is array (natural range <>) of natural range 0 to n;
--	signal cnt_aux : int_vec(0 to n);

	type int_vec is array (0 to n) of natural range 0 to n;
	signal cnt_aux : int_vec;
begin
	
	--cnt <= 0 + XNot(1) + XNot(2) + XNot(3) + XNot(4) + XNot(5) + XNot(6) + XNot(7) + XNot(8) + XNot(9);

	cnt_aux(1) <= 0 when x(0) = '0' else 1;
	contador: 
	for i in 1 to n-1 generate
		cnt_aux(i+1) <= cnt_aux(i) + 1 when x(i) = '1' else cnt_aux(i);
	end generate;

	cnt <= cnt_aux(n);
end architecture;

architecture arthur_v2 of HammingWeight is

--	type int_vec is array (natural range <>) of natural range 0 to n;
--	signal cnt_aux : int_vec(0 to n);

	type int_vec is array (0 to n) of natural range 0 to n;
	signal cnt_aux : int_vec;
begin
	
	cnt_aux(0) <= 0;
	contador: 
	for i in 0 to n-1 generate
		cnt_aux(i+1) <= cnt_aux(i) + 1 when x(i) = '1' else cnt_aux(i);
	end generate;

	cnt <= cnt_aux(n);
end architecture;

--configuration  of <entity_name> is
--	for <architecture_name>
--	end for;
--end <configuration_name>;

