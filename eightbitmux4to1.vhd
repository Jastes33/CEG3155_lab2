--Lab2 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightbitmux4to1 IS
	PORT(
		i_select:IN STD_LOGIC_VECTOR(0 to 1);
		i_RL:IN STD_LOGIC_VECTOR(0 to 7);
		i_RR:IN STD_LOGIC_VECTOR(0 to 7);
		o_s: OUT STD_LOGIC_VECTOR(0 to 7));
END eightbitmux4to1;

Architecture eightbitmux4to1_a OF eightbitmux4to1 IS

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
	i_m(0) => '0',
	i_m(1) => i_RR(0),
	i_m(2) => i_RL(0),
	i_m(3) => (i_RL(0) or i_RR(0)),
	o_d => o_s(0)
	);
	
	bmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => '0',
	i_m(1) => i_RR(1),
	i_m(2) => i_RL(1),
	i_m(3) => (i_RL(1) or i_RR(1)),
	o_d => o_s(1)
	);
	
	cmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => '0',
	i_m(1) => i_RR(2),
	i_m(2) => i_RL(2),
	i_m(3) => (i_RL(2) or i_RR(2)),
	o_d => o_s(2)
	);
	
	dmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => '0',
	i_m(1) => i_RR(3),
	i_m(2) => i_RL(3),
	i_m(3) => (i_RL(3) or i_RR(3)),
	o_d => o_s(3)
	);
	
	emux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => '0',
	i_m(1) => i_RR(4),
	i_m(2) => i_RL(4),
	i_m(3) => (i_RL(4) or i_RR(4)),
	o_d => o_s(4)
	);
	
	fmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => '0',
	i_m(1) => i_RR(5),
	i_m(2) => i_RL(5),
	i_m(3) => (i_RL(5) or i_RR(5)),
	o_d => o_s(5)
	);
	
	gmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => '0',
	i_m(1) => i_RR(6),
	i_m(2) => i_RL(6),
	i_m(3) => (i_RL(6) or i_RR(6)),
	o_d => o_s(6)
	);
	
	hmux4to1 : mux4to1
	PORT MAP( 
	i_sel(0) => i_select(0),
	i_sel(1) => i_select(1),
	i_m(0) => '0',
	i_m(1) => i_RR(7),
	i_m(2) => i_RL(7),
	i_m(3) => (i_RL(7) or i_RR(7)),
	o_d => o_s(7)
	);
	
END eightbitmux4to1_a;

	







	
	
	
	
	
	
	
	
	
	