library ieee;
use ieee.std_logic_1164.all;

entity cap5_ex14 is
	port
	(

		A	: in  std_logic;

		Y	: out std_logic
	);
end ;

architecture adder_keep of cap5_ex14 is
	signal B, C, D, Y1, Y2 : std_logic;
	attribute keep : boolean;
	attribute keep of B,C,D, Y1, Y2 : signal is true;
begin

	Y <= Y1 or Y2;
	Y1 <= B and A;
	B  <= not A;

	Y2 <= C and D;
	D <= not C;
	C <= not A;

end ;