--Lab2 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY multiply IS
	PORT(
		i_dataA:IN STD_LOGIC_VECTOR(0 to 3);
		i_dataB:IN STD_LOGIC_VECTOR(0 to 3);
		i_clock:IN STD_LOGIC;
		i_loadA,i_loadB:IN STD_LOGIC;
		i_enableA, i_enableB, i_ENProduct:IN STD_LOGIC;
		i_pSel :IN STD_LOGIC;
		
		o_product: OUT STD_LOGIC_VECTOR(0 to 7);
		o_z :OUT STD_LOGIC;
		--- following outputs are for testing
		o_b0:OUT STD_LOGIC;
		o_pcarry: out STD_LOGIC);
		
	END multiply;

Architecture multiply_a OF multiply IS

	SIGNAL int_shiftL :STD_LOGIC_VECTOR(0 to 7);
	SIGNAL int_shiftR :STD_LOGIC_VECTOR(0 to 3);
	SIGNAL int_displayReg: STD_LOGIC_VECTOR(0 to 7);
	SIGNAL int_sum: STD_LOGIC_VECTOR(0 to 7);
	SIGNAL int_mux: STD_LOGIC_VECTOR(0 to 7);

	component shiftLEFT
		PORT(
		i_sL:IN STD_LOGIC_VECTOR(0 to 7);
		i_Gclock:IN STD_LOGIC;
		i_shiftL: IN STD_LOGIC;
		i_Greset :IN STD_LOGIC;
		o_kL: OUT STD_LOGIC_VECTOR(0 to 7));
	END component;
	
	component shiftRight4
		PORT(
		i_sR:IN STD_LOGIC_VECTOR(0 to 3);
		i_Gclock:IN STD_LOGIC;
		i_shiftR: IN STD_LOGIC;
		i_Greset :IN STD_LOGIC;
		o_kR: OUT STD_LOGIC_VECTOR(0 to 3));
	END component;
	
	component full8bitADD
		PORT(
		i_xx, i_yy : IN STD_logic_vector(0 to 7);
		i_cinBit :IN STD_logic;
		o_s:OUT STD_logic_vector(0 to 7);
		o_c:OUT STD_logic);
	END component;
	
	component displayReg8
		PORT(
			i_s:IN STD_LOGIC_VECTOR(0 to 7);
			i_Gclock:IN STD_LOGIC;
			i_Greset :IN STD_LOGIC;
			o_DisplayOut: OUT STD_LOGIC_VECTOR(0 to 7));
	END component;
	
	component mux2choice8bit
		PORT(
		i_in1:IN STD_LOGIC_VECTOR(0 to 7);
		i_in2:IN STD_LOGIC_VECTOR(0 to 7);
		i_select:IN STD_LOGIC;
		o_muxOUT: OUT STD_LOGIC_VECTOR(0 to 7));
	END component;
	
BEGIN

	aShiftLeftReg : shiftLEFT
	PORT MAP(
		i_sL(0) => '0',
		i_sL(1) => '0',
		i_sL(2) => '0',
		i_sL(3) => '0',
		i_sL(4) => i_dataA(0),
		i_sL(5) => i_dataA(1),
		i_sL(6) => i_dataA(2),
		i_sL(7) => i_dataA(3),
		
		i_Gclock => i_clock,
		i_shiftL => i_loadA,
		i_Greset => i_enableA,
		
		o_kL(0) => int_shiftL(0),
		o_kL(1) => int_shiftL(1),
		o_kL(2) => int_shiftL(2),
		o_kL(3) => int_shiftL(3),
		o_kL(4) => int_shiftL(4),
		o_kL(5) => int_shiftL(5),
		o_kL(6) => int_shiftL(6),
		o_kL(7) => int_shiftL(7)
		
		);
		
	ashiftRightReg : shiftRight4
	PORT MAP( 
		i_sR(0) => i_dataB(0),
		i_sR(1) => i_dataB(1),
		i_sR(2) => i_dataB(2),
		i_sR(3) => i_dataB(3),
		i_Gclock => i_clock,
		i_shiftR => i_loadB,
		i_Greset => i_enableB,
			
		o_KR(0) => int_shiftR(0),
		o_KR(1) => int_shiftR(1),
		o_KR(2) => int_shiftR(2),
		o_KR(3) => int_shiftR(3)
		);
		
	afullAdder : full8bitADD
	PORT MAP(
		i_xx(0) => int_shiftL(0),
		i_xx(1) => int_shiftL(1),
		i_xx(2) => int_shiftL(2),
		i_xx(3) => int_shiftL(3),
		i_xx(4) => int_shiftL(4),
		i_xx(5) => int_shiftL(5),
		i_xx(6) => int_shiftL(6),
		i_xx(7) => int_shiftL(7),
		
		i_yy(0) => int_displayReg(0),
		i_yy(1) => int_displayReg(1),
		i_yy(2) => int_displayReg(2),
		i_yy(3) => int_displayReg(3),
		i_yy(4) => int_displayReg(4),
		i_yy(5) => int_displayReg(5),
		i_yy(6) => int_displayReg(6),
		i_yy(7) => int_displayReg(7),
		
		i_cinBit => '0',
		
		o_s(0) =>int_sum(0),
		o_s(1) =>int_sum(1),
		o_s(2) =>int_sum(2),
		o_s(3) =>int_sum(3),
		o_s(4) =>int_sum(4),
		o_s(5) =>int_sum(5),
		o_s(6) =>int_sum(6),
		o_s(7) =>int_sum(7),
		
		o_c => o_pcarry
		);
		
	amux : mux2choice8bit
	PORT MAP(
		i_in1(0) => int_sum(0),
		i_in1(1) => int_sum(1),
		i_in1(2) => int_sum(2),
		i_in1(3) => int_sum(3),
		i_in1(4) => int_sum(4),
		i_in1(5) => int_sum(5),
		i_in1(6) => int_sum(6),
		i_in1(7) => int_sum(7),
		
		i_in2(0) => '0',
		i_in2(1) => '0',
		i_in2(2) => '0',
		i_in2(3) => '0',
		i_in2(4) => '0',
		i_in2(5) => '0',
		i_in2(6) => '0',
		i_in2(7) => '0',
		
		i_select => i_pSel,
		
		o_muxOUT(0) => int_mux(0),
		o_muxOUT(1) => int_mux(1),
		o_muxOUT(2) => int_mux(2),
		o_muxOUT(3) => int_mux(3),
		o_muxOUT(4) => int_mux(4),
		o_muxOUT(5) => int_mux(5),
		o_muxOUT(6) => int_mux(6),
		o_muxOUT(7) => int_mux(7)
		);
		
		
	adisplay: displayReg8
	PORT MAP(
		i_s(0) => int_mux(0),
		i_s(1) => int_mux(1),
		i_s(2) => int_mux(2),
		i_s(3) => int_mux(3),
		i_s(4) => int_mux(4),
		i_s(5) => int_mux(5),
		i_s(6) => int_mux(6),
		i_s(7) => int_mux(7),
		
		i_Gclock => i_clock,
		i_Greset => i_ENProduct,
		o_DisplayOut(0) => int_displayReg(0),
		o_DisplayOut(1) => int_displayReg(1),
		o_DisplayOut(2) => int_displayReg(2),
		o_DisplayOut(3) => int_displayReg(3),
		o_DisplayOut(4) => int_displayReg(4),
		o_DisplayOut(5) => int_displayReg(5),
		o_DisplayOut(6) => int_displayReg(6),
		o_DisplayOut(7) => int_displayReg(7)
		
		);
		
		
		o_product(0) <= int_displayReg(0);
		o_product(1) <= int_displayReg(1);
		o_product(2) <= int_displayReg(2);
		o_product(3) <= int_displayReg(3);
		o_product(4) <= int_displayReg(4);
		o_product(5) <= int_displayReg(5);
		o_product(6) <= int_displayReg(6);
		o_product(7) <= int_displayReg(7);
		
		o_b0 <= int_shiftR(0);
		o_z <= (not(((int_shiftR(0) or int_shiftR(1)) or int_shiftR(2)) or int_shiftR(3)));
		
END multiply_a;