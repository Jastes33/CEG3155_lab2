--Lab2 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4to1 IS
	PORT(
		i_sel:IN STD_LOGIC_VECTOR(0 to 1);
		i_m:IN STD_LOGIC_VECTOR(0 to 3);
		o_d: OUT STD_LOGIC);
END mux4to1;

Architecture mux4to1_a OF mux4to1 IS

	SIGNAL int_opt: STD_LOGIC_VECTOR(0 to 3);


BEGIN
	int_opt(0) <= ((not i_sel(0))and (not i_sel(1)) and i_m(0));
	int_opt(1) <= ((i_sel(0))and (not i_sel(1)) and i_m(1));
	int_opt(2) <= ((not i_sel(0))and (i_sel(1)) and i_m(2));
	int_opt(3) <= ((i_sel(0))and (i_sel(1)) and i_m(3));
	
	o_d <= (int_opt(0) or int_opt(1) or int_opt(2) or int_opt(3));

END mux4to1_a;