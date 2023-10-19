--Lab2 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY topDatapath IS
	PORT(
		i_operandA, i_operandB:IN STD_LOGIC_VECTOR(0 to 3);
		i_Gclock :IN STD_LOGIC;
		i_Greset :IN STD_LOGIC;
		i_OpSel : IN STD_LOGIC_VECTOR(0 to 1);
		o_MuxOut: OUT STD_LOGIC_VECTOR(0 to 7);
		o_carryOut: OUT STD_LOGIC;
		o_ZeroOut: OUT STD_LOGIC;
		o_OverFlowOut :OUT STd_LOGIC
	
		);
END topDatapath;

Architecture topDatapath_a OF topDatapath IS

	SIGNAL int_regA, int_regB:STD_LOGIC_VECTOR(0 to 7);
	SIGNAL int_add, int_div, int_mult, int_sub: STD_LOGIC_VECTOR(0 to 7);
	SIGNAL int_MuxOut :STD_LOGIC_VECTOR(0 to 7);
	
component zerotest
	PORT(
		i_in:IN STD_LOGIC_VECTOR(0 to 7);
		o_d: OUT STD_LOGIC);
END component;

	component bit4reg
		PORT(
		i_s:IN STD_LOGIC_VECTOR(0 to 3);
		i_Gclock:IN STD_LOGIC;
		i_Greset :IN STD_LOGIC;
		o_DisplayOut: OUT STD_LOGIC_VECTOR(0 to 3));
	END component;
	
	component myALU
		PORT(
		i_a:IN STD_LOGIC_VECTOR(0 to 3);
		i_b:IN STD_LOGIC_VECTOR(0 to 3);
		i_opSel: IN STD_LOGIC_Vector(0 to 1); --00:ADD, 01: SUB, 10:Mult, 11:DIV
		i_Gclock:IN STD_LOGIC;
		o_add: OUT STD_LOGIC_VECTOR(0 to 7);
		o_sub: OUT STD_LOGIC_VECTOR(0 to 7);
		o_mult: OUT STD_LOGIC_VECTOR(0 to 7);
		o_div: OUT STD_LOGIC_VECTOR(0 to 7);
		o_carry: OUT STD_LOGIC;
		o_of: out STD_LOGIC);
	END component;
	
	component six4mux4to1
	PORT(
		i_select:IN STD_LOGIC_VECTOR(0 to 1);
		i_R0:IN STD_LOGIC_VECTOR(0 to 7);
		i_R1:IN STD_LOGIC_VECTOR(0 to 7);
		i_R2:IN STD_LOGIC_VECTOR(0 to 7);
		i_R3:IN STD_LOGIC_VECTOR(0 to 7);
		o_s: OUT STD_LOGIC_VECTOR(0 to 7));
	END component;
	
BEGIN


	areg : bit4reg
	PORT MAP(
	i_s(0) => i_operandA(0),
	i_s(1) => i_operandA(1),
	i_s(2) => i_operandA(2),
	i_s(3) => i_operandA(3),
	i_Gclock => i_Gclock,
	i_Greset => i_Greset,
	o_displayOut(0) => int_regA(0),
	o_displayOut(1) => int_regA(1),
	o_displayOut(2) => int_regA(2),
	o_displayOut(3) => int_regA(3)
	);
	
	breg : bit4reg
	PORT MAP(
	i_s(0) => i_operandB(0),
	i_s(1) => i_operandB(1),
	i_s(2) => i_operandB(2),
	i_s(3) => i_operandB(3),
	i_Gclock => i_Gclock,
	i_Greset => i_Greset,
	o_displayOut(0) => int_regB(0),
	o_displayOut(1) => int_regB(1),
	o_displayOut(2) => int_regB(2),
	o_displayOut(3) => int_regB(3)
	);
	
	
	aALU : myALU
	PORT MAP(
	i_a(0) => int_regA(0),
	i_a(1) => int_regA(1),
	i_a(2) => int_regA(2),
	i_a(3) => int_regA(3),
	i_b(0) => int_regB(0),
	i_b(1) => int_regB(1),
	i_b(2) => int_regB(2),
	i_b(3) => int_regB(3),
	
	i_opSel(0) => i_OpSel(0),
	i_opSel(1) => i_OpSel(1),
	
	o_add(0)=> int_add(0),
	o_add(1)=> int_add(1),
	o_add(2)=> int_add(2),
	o_add(3)=> int_add(3),
	o_add(4)=> int_add(4),
	o_add(5)=> int_add(5),
	o_add(6)=> int_add(6),
	o_add(7)=> int_add(7),
	
	o_sub(0) => int_sub(0),
	o_sub(1) => int_sub(1),
	o_sub(2) => int_sub(2),
	o_sub(3) => int_sub(3),
	o_sub(4) => int_sub(4),
	o_sub(5) => int_sub(5),
	o_sub(6) => int_sub(6),
	o_sub(7) => int_sub(7),
	
	o_mult(0) => int_mult(0),
	o_mult(1) => int_mult(1),
	o_mult(2) => int_mult(2),
	o_mult(3) => int_mult(3),
	o_mult(4) => int_mult(4),
	o_mult(5) => int_mult(5),
	o_mult(6) => int_mult(6),
	o_mult(7) => int_mult(7),
	
	o_div(0) => int_div(0),
	o_div(1) => int_div(1),
	o_div(2) => int_div(2),
	o_div(3) => int_div(3),
	o_div(4) => int_div(4),
	o_div(5) => int_div(5),
	o_div(6) => int_div(6),
	o_div(7) => int_div(7),
	i_Gclock => i_Gclock,
	o_carry => o_carryOut,
	o_of => o_OverFlowOut
	);
	
	amux : six4mux4to1
	PORT MAP(
		i_select(0) => i_OpSel(0),
		i_select(1) => i_OPsel(1),
		
		i_R0(0) => int_add(0),
		i_R0(1) => int_add(1),
		i_R0(2) => int_add(2),
		i_R0(3) => int_add(3),
		i_R0(4) => int_add(4),
		i_R0(5) => int_add(5),
		i_R0(6) => int_add(6),
		i_R0(7) => int_add(7),
		
		i_R1(0) => int_sub(0),
		i_R1(1) => int_sub(1),
		i_R1(2) => int_sub(2),
		i_R1(3) => int_sub(3),
		i_R1(4) => int_sub(4),
		i_R1(5) => int_sub(5),
		i_R1(6) => int_sub(6),
		i_R1(7) => int_sub(7),
		
		i_R2(0) => int_mult(0),
		i_R2(1) => int_mult(1),
		i_R2(2) => int_mult(2),
		i_R2(3) => int_mult(3),
		i_R2(4) => int_mult(4),
		i_R2(5) => int_mult(5),
		i_R2(6) => int_mult(6),
		i_R2(7) => int_mult(7),
		
		i_R3(0) => int_div(0),
		i_R3(1) => int_div(1),
		i_R3(2) => int_div(2),
		i_R3(3) => int_div(3),
		i_R3(4) => int_div(4),
		i_R3(5) => int_div(5),
		i_R3(6) => int_div(6),
		i_R3(7) => int_div(7),
		
		o_s => int_MuxOut
	);
	zeros :zerotest
	PORT map(
		i_in => int_MuxOut,
		o_d => o_zeroOut);
		
		o_MuxOut <= int_MuxOut;
--	o_zeroOut <= (((((((int_MuxOut(0) nor int_MuxOut(1)) nor int_MuxOut(2)) nor int_MuxOut(3)) nor int_MuxOut(4)) nor int_MuxOut(5)) nor int_MuxOut(6)) nor int_MuxOut(7));

END topDatapath_a;