--Lab2 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shiftLEFT4b IS
	PORT(
		i_sL:IN STD_LOGIC_VECTOR(0 to 3);
		i_Gclock:IN STD_LOGIC;
		i_shiftL: IN STD_LOGIC;
		i_Greset :IN STD_LOGIC;
		i_w :in std_LOGIC;
		o_kL: OUT STD_LOGIC_VECTOR(0 to 3));
END shiftLEFT4b;

Architecture shiftLEFT_a OF shiftLEFT4b IS

	SIGNAL int_sel0, int_sel1 :STD_LOGIC;
	SIGNAL int_d: STD_LOGIC_VECTOR(0 to 3);
	SigNAL int_w: std_LOGIC;
	
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
		i_sel(0) => not i_shiftL,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sL(1),
		i_m(3) => i_sL(0),
		o_d => int_d(0));
		
	bmux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftL,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sL(2),
		i_m(3) => i_sL(1),
		o_d => int_d(1));
		
	cmux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftL,
		i_sel(1) => not i_Greset,
		i_m(0) => '0',
		i_m(1) => '0',
		i_m(2) => i_sL(3),
		i_m(3) => i_sL(2),
		o_d => int_d(2));
		
	dmux4to1 : mux4to1
	PORT MAP(
		i_sel(0) => not i_shiftL,
		i_sel(1) => not i_Greset,
		i_m(0) => '1',
		i_m(1) => '1',
		i_m(2) => '0',
		i_m(3) => i_sL(3),
		o_d => int_d(3));
	
	aDFF :myDFF
	PORT MAP(
		i_d => (int_d(0) or int_w),
		i_clock => i_Gclock,
		o_qDFF => o_kL(0));
		
	bDFF :myDFF
	PORT MAP(
		i_d => int_d(1),
		i_clock => i_Gclock,
		o_qDFF => o_kL(1));
	
	cDFF :myDFF
	PORT MAP(
		i_d => int_d(2),
		i_clock => i_Gclock,
		o_qDFF => o_kL(2));
		
	
	dDFF :myDFF
	PORT MAP(
		i_d => int_d(3),
		i_clock => i_Gclock,
		o_qDFF => o_kL(3));
		
int_w <= (i_shiftL and i_w);
		
END shiftLEFT_a;