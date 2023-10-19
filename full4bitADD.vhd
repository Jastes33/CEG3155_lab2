--Lab2 CEG3155 Group 3
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full4bitADD IS
	PORT(
	i_xx, i_yy : IN STD_logic_vector(0 to 3);
	i_cinBit :IN STD_logic;
	o_s:OUT STD_logic_vector(0 to 3);
	o_c:OUT STD_logic);
END full4bitADD;

Architecture rtl of full4bitADD IS

	SIGNAL int_c :STD_logic_vector(0 to 7);

	component fullADD
		PORT(
		i_x, i_y, i_cin : IN STD_logic;
		o_sum, o_cout :OUT STD_logic);
	END component;

BEGIN
	aFulladd : fullADD
	PORT MAP(
	i_x => i_xx(0),
	i_y => i_yy(0),
	i_cin => i_cinBit,
	o_sum => o_s(0),
	o_cout => int_c(0)
	);
	
	bFulladd : fullADD
	PORT MAP(
	i_x => i_xx(1),
	i_y => i_yy(1),
	i_cin => int_c(0),
	o_sum => o_s(1),
	o_cout => int_c(1)
	);
	
	cFulladd : fullADD
	PORT MAP(
	i_x => i_xx(2),
	i_y => i_yy(2),
	i_cin => int_c(1),
	o_sum => o_s(2),
	o_cout => int_c(2)
	);
	
	dFulladd : fullADD
	PORT MAP(
	i_x => i_xx(3),
	i_y => i_yy(3),
	i_cin => int_c(2),
	o_sum => o_s(3),
	o_cout => o_c
	);
END rtl;
	