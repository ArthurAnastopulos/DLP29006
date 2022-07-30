library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2bcd is
	port
	(
		bin : in std_logic_vector(9 downto 0);
		bcd_c : out std_logic_vector(3 downto 0);
		bcd_d : out std_logic_vector(3 downto 0);
		bcd_u : out std_logic_vector(3 downto 0)
	);
end entity;

architecture bin2bcd of bin2bcd is
	signal aux_int : integer  range 0 to 999;
	signal c_int : integer  range 0 to 9;
	signal d_int : integer  range 0 to 9;
	signal u_int : integer  range 0 to 9;
begin

	aux_int <= to_integer(unsigned(bin)); ---999
	c_int <= aux_int / 100; --- 999/100 = 9
	d_int <= aux_int / 10 - (c_int * 10); -- 99 - 90 = 9
	u_int <= aux_int - ((c_int * 100) + (d_int * 10)); -- 999 - 990 = 9

	bcd_c <= std_logic_vector(to_unsigned(c_int, 4));
	bcd_d <= std_logic_vector(to_unsigned(d_int, 4));
	bcd_u <= std_logic_vector(to_unsigned(u_int, 4));
	
end architecture;