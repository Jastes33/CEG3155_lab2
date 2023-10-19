--Lab1 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shiftRight IS
	PORT(
		i_sR:IN STD_LOGIC_VECTOR(0 to 7);
		i_Gclock:IN STD_LOGIC;
		i_shiftR: IN STD_LOGIC;
		i_Greset :IN STD_LOGIC;
		o_kR: OUT STD_LOGIC_VECTOR(0 to 7));
END shiftRight;

Architecture shiftRight_a OF shiftRight IS

	SIGNAL int_sel0, int_sel1 :STD_LOGIC;
	SIGNAL int_d: STD_LOGIC_VECTOR(0 to 7);
	
	component mux4to1
		PORT(
		i_sel:IN STD_LOGIC_VECTOR(0 to 1);
		i_m:IN STD_LOGIC_VECTOR(0 to 3);
		o_d: OUT STD_LOGIC);
	END component;
	
	component myDFF
		PORT(
		i_d:IN STD_LOGIC;
		i_clock:IN STD_LOGIC;
		o_qDFF: OUT STD_LOGIC;
		o_qbarDFF: OUT STD_LOGIC);	
	END component;

Begin
	
	amux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftR,
		i_sel(1) => not i_Greset,
		i_m(0) => '1',
		i_m(1) => '1',
		i_m(2) => i_sR(7),
		i_m(3) => i_sR(0),
		o_d => int_d(0));
		
	bmux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftR,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sR(0),
		i_m(3) => i_sR(1),
		o_d => int_d(1));
		
	cmux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftR,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sR(1),
		i_m(3) => i_sR(2),
		o_d => int_d(2));
		
	dmux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftR,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sR(2),
		i_m(3) => i_sR(3),
		o_d => int_d(3));
	
	emux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftR,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sR(3),
		i_m(3) => i_sR(4),
		o_d => int_d(4));
	
	fmux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftR,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sR(4),
		i_m(3) => i_sR(5),
		o_d => int_d(5));
	
	gmux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftR,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sR(5),
		i_m(3) => i_sR(6),
		o_d => int_d(6));
		
	hmux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftR,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sR(6),
		i_m(3) => i_sR(7),
		o_d => int_d(7));
	
	aDFF :myDFF
	PORT MAP(
		i_d => int_d(0),
		i_clock => i_Gclock,
		o_qDFF => o_kR(0));
		
	bDFF :myDFF
	PORT MAP(
		i_d => int_d(1),
		i_clock => i_Gclock,
		o_qDFF => o_kR(1));
	
	cDFF :myDFF
	PORT MAP(
		i_d => int_d(2),
		i_clock => i_Gclock,
		o_qDFF => o_kR(2));
		
	dDFF :myDFF
	PORT MAP(
		i_d => int_d(3),
		i_clock => i_Gclock,
		o_qDFF => o_kR(3));
		
	eDFF :myDFF
	PORT MAP(
		i_d => int_d(4),
		i_clock => i_Gclock,
		o_qDFF => o_kR(4));
		
	fDFF :myDFF
	PORT MAP(
		i_d => int_d(5),
		i_clock => i_Gclock,
		o_qDFF => o_kR(5));
		
	gDFF :myDFF
	PORT MAP(
		i_d => int_d(6),
		i_clock => i_Gclock,
		o_qDFF => o_kR(6));
		
	hDFF :myDFF
	PORT MAP(
		i_d => int_d(7),
		i_clock => i_Gclock,
		o_qDFF => o_kR(7));

END shiftRight_a;