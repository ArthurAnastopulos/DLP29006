entity Q3 is
	port
	(
		a, b, c, d : in bit;
		z : out bit
	);
end entity;

architecture Q3_v1 of Q3 is
	signal z1, z2, z3 : bit;
	signal b1, d1 : bit;
	attribute keep : boolean;
	attribute keep of b1, d1: signal is true;
begin

	b1 <= not b;
	d1 <= not d;
	z1 <= a and b1 and c and d1;
	
	z2 <= d and c and b and a;
	
	z3 <= not(d or b);
	
	z <= z1 or z2 or z3;
	

end architecture;
