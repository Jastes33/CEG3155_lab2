--Lab2 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY displayReg8 IS
	PORT(
		i_s:IN STD_LOGIC_VECTOR(0 to 7);
		i_Gclock:IN STD_LOGIC;
		i_Greset :IN STD_LOGIC;
		o_DisplayOut: OUT STD_LOGIC_VECTOR(0 to 7));
END displayReg8;

Architecture displayReg8_a OF displayReg8 IS

	SIGNAL int_sel0, int_sel1 :STD_LOGIC;
	SIGNAL int_d: STD_LOGIC_VECTOR(0 to 7);
	
	component my2to1
		PORT(
		i_op0:IN STD_LOGIC;
		i_op1:IN STD_LOGIC;
		i_selection: IN STD_LOGIC;
		o_choice:OUT STD_LOGIC);		
	END component;
	
	component myDFF
		PORT(
		i_d:IN STD_LOGIC;
		i_clock:IN STD_LOGIC;
		o_qDFF: OUT STD_LOGIC;
		o_qbarDFF: OUT STD_LOGIC);	
	END component;

Begin

	amux2to1 : my2to1
	PORT MAP(
		i_op0 => '0',
		i_op1 => i_s(0),
		i_selection => i_Greset,
		o_choice => int_d(0));
		
	bmux2to1 : my2to1
	PORT MAP(
		i_op0 => '0',
		i_op1 => i_s(1),
		i_selection => i_Greset,
		o_choice => int_d(1));
		
	cmux2to1 : my2to1
	PORT MAP(
		i_op0 => '0',
		i_op1 => i_s(2),
		i_selection => i_Greset,
		o_choice => int_d(2));
		
	dmux2to1 : my2to1
	PORT MAP(
		i_op0 => '0',
		i_op1 => i_s(3),
		i_selection => i_Greset,
		o_choice => int_d(3));
		
	emux2to1 : my2to1
	PORT MAP(
		i_op0 => '0',
		i_op1 => i_s(4),
		i_selection => i_Greset,
		o_choice => int_d(4));
	
	fmux2to1 : my2to1
	PORT MAP(
		i_op0 => '0',
		i_op1 => i_s(5),
		i_selection => i_Greset,
		o_choice => int_d(5));
	
	gmux2to1 : my2to1
	PORT MAP(
		i_op0 => '0',
		i_op1 => i_s(6),
		i_selection => i_Greset,
		o_choice => int_d(6));
		
	hmux2to1 : my2to1
	PORT MAP(
		i_op0 => '0',
		i_op1 => i_s(7),
		i_selection => i_Greset,
		o_choice => int_d(7));
		
	aDFF :myDFF
	PORT MAP(
		i_d => int_d(0),
		i_clock => i_Gclock,
		o_qDFF => o_DisplayOut(0));
		
	bDFF :myDFF
	PORT MAP(
		i_d => int_d(1),
		i_clock => i_Gclock,
		o_qDFF => o_DisplayOut(1));
	
	cDFF :myDFF
	PORT MAP(
		i_d => int_d(2),
		i_clock => i_Gclock,
		o_qDFF => o_DisplayOut(2));
		
	dDFF :myDFF
	PORT MAP(
		i_d => int_d(3),
		i_clock => i_Gclock,
		o_qDFF => o_DisplayOut(3));
		
	eDFF :myDFF
	PORT MAP(
		i_d => int_d(4),
		i_clock => i_Gclock,
		o_qDFF => o_DisplayOut(4));
		
	fDFF :myDFF
	PORT MAP(
		i_d => int_d(5),
		i_clock => i_Gclock,
		o_qDFF => o_DisplayOut(5));
		
	gDFF :myDFF
	PORT MAP(
		i_d => int_d(6),
		i_clock => i_Gclock,
		o_qDFF => o_DisplayOut(6));
		
	hDFF :myDFF
	PORT MAP(
		i_d => int_d(7),
		i_clock => i_Gclock,
		o_qDFF => o_DisplayOut(7)
		);
	
END displayReg8_a;

