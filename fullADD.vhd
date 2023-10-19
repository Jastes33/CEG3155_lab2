--Lab2 CEG3155 Group 3
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fullADD IS
	PORT(
	i_x, i_y, i_cin : IN STD_logic;
	o_sum, o_cout :OUT STD_logic);
END fullADD;

Architecture rtl of fullADD IS

	SIGNAL int_c,int_c2,int_s :STD_logic;

	component halfAdd
		PORT(
		i_a, i_b : IN STD_logic;
		o_s, o_c :OUT STD_logic);
	END component;

BEGIN
	firstHalfadd : halfAdd
	PORT MAP(
	i_a => i_x,
	i_b => i_y,
	o_s => int_s,
	o_c => int_c
	);
	
	secondHalfadd : halfAdd
	PORT MAP(
	i_a => i_cin,
	i_b => int_s,
	o_s => o_sum,
	o_c => int_c2
	);
	
	o_cout <= (int_c or int_c2);
	
END rtl; 
