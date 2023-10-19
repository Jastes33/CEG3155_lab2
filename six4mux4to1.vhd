--Lab2 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY six4mux4to1 IS
	PORT(
		i_select:IN STD_LOGIC_VECTOR(0 to 1);
		i_R0:IN STD_LOGIC_VECTOR(0 to 7);
		i_R1:IN STD_LOGIC_VECTOR(0 to 7);
		i_R2:IN STD_LOGIC_VECTOR(0 to 7);
		i_R3:IN STD_LOGIC_VECTOR(0 to 7);
		o_s: OUT STD_LOGIC_VECTOR(0 to 7));
END six4mux4to1;

Architecture six4mux4to1_a OF six4mux4to1 IS

	SIGNAL int_opt: STD_LOGIC_VECTOR(0 to 3);
	
	component mux4to1
	PORT( 
		i_sel:IN STD_LOGIC_VECTOR(0 to 1);
		i_m:IN STD_LOGIC_VECTOR(0 to 3);
		o_d: OUT STD_LOGIC);
	END component;
	

BEGIN

	amux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => i_R0(0),
	i_m(1) => i_R1(0),
	i_m(2) => i_R2(0),
	i_m(3) => i_R3(0),
	o_d => o_s(0)
	);
	
	bmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => i_R0(1),
	i_m(1) => i_R1(1),
	i_m(2) => i_R2(1),
	i_m(3) => i_R3(1),
	o_d => o_s(1)
	);
	
	cmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => i_R0(2),
	i_m(1) => i_R1(2),
	i_m(2) => i_R2(2),
	i_m(3) => i_R3(2),
	o_d => o_s(2)
	);
	
	dmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => i_R0(3),
	i_m(1) => i_R1(3),
	i_m(2) => i_R2(3),
	i_m(3) => i_R3(3),
	o_d => o_s(3)
	);
	
	emux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => i_R0(4),
	i_m(1) => i_R1(4),
	i_m(2) => i_R2(4),
	i_m(3) => i_R3(4),
	o_d => o_s(4)
	);
	
	fmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => i_R0(5),
	i_m(1) => i_R1(5),
	i_m(2) => i_R2(5),
	i_m(3) => i_R3(5),
	o_d => o_s(5)
	);
	
	gmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => i_R0(6),
	i_m(1) => i_R1(6),
	i_m(2) => i_R2(6),
	i_m(3) => i_R3(6),
	o_d => o_s(6)
	);
	
	hmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => i_R0(7),
	i_m(1) => i_R1(7),
	i_m(2) => i_R2(7),
	i_m(3) => i_R3(7),
	o_d => o_s(7)
	);
	
END six4mux4to1_a;
