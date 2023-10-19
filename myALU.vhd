--Lab2 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY myALU IS
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
END myALU;

Architecture myALU_a OF myALU IS

	SIGNAL int_addsub: STD_LOGIC_VECTOR(0 to 3);
	SIGNAL int_addsubCarry, int_prodcarry: STD_LOGIC;
	SIGNAL int_z, int_b0: STD_LOGIC;
	SIGNAL int_mult: STD_LOGIC_VECTOR(0 to 7);
	SIGNAL int_div0, int_div1: STD_LOGIC_VECTOR(0 to 3);

	component addSUB4
	PORT(
		i_xx, i_yy : IN STD_logic_vector(0 to 3);
		i_operation: IN STD_logic;
		o_s:OUT STD_logic_vector(0 to 3);
		o_c:OUT STD_logic);
	END component;
	
	-- mulitplier comonent
	
	component multiply
		PORT(
		i_dataA:IN STD_LOGIC_VECTOR(0 to 3);
		i_dataB:IN STD_LOGIC_VECTOR(0 to 3);
		i_clock:IN STD_LOGIC;
		i_loadA,i_loadB:IN STD_LOGIC;
		i_enableA, i_enableB, i_ENProduct:IN STD_LOGIC;
		i_pSel :IN STD_LOGIC;
		o_product: OUT STD_LOGIC_VECTOR(0 to 7);
		o_z :OUT STD_LOGIC;
		o_b0:OUT STD_LOGIC;
		o_pcarry: out STD_LOGIC);
	END component;
		
	
	-- division component
component divider4b
	PORT(
	i_clock: in std_logic;
	i_aReg: in std_logic_vector(0 to 3);
	i_lsA: in std_logic;
	o_aReg: out std_LOGIC_VECTOR(0 to 3);
	i_bReg: in std_logic_vector(0 to 3);
	i_rsel: in std_logic;
	o_remainder: out std_logic_vector(0 to 3);
	i_lsR: in std_logic;
	o_Quotiant: out std_logic_vector (0 to 3));
end component;
component mux4to1
	PORT(
		i_sel:IN STD_LOGIC_VECTOR(0 to 1);
		i_m:IN STD_LOGIC_VECTOR(0 to 3);
		o_d: OUT STD_LOGIC);
END component;

	Begin

	aaddSub : addSUB4
	PORT MAP(
		i_xx(0) => i_a(0),
		i_xx(1) => i_a(1),
		i_xx(2) => i_a(2),
		i_xx(3) => i_a(3),
		
		i_yy(0) => i_b(0),
		i_yy(1) => i_b(1),
		i_yy(2) => i_b(2),
		i_yy(3) => i_b(3),
		
		i_operation => i_opSel(1),  -- Note if 0 add, if 1 substract
		o_s(0) => int_addsub(0),
		o_s(1) => int_addsub(1),
		o_s(2) => int_addsub(2),
		o_s(3) => int_addsub(3),
		o_c => int_addsubCarry
	);
	
	amultiplier : multiply
	PORT MAP(
		i_dataA(0) => i_a(0), 
		i_dataA(1) => i_a(1), 
		i_dataA(2) => i_a(2), 
		i_dataA(3) => i_a(3), 
		i_dataB(0) => i_b(0),
		i_dataB(1) => i_b(1),
		i_dataB(2) => i_b(2),
		i_dataB(3) => i_b(3),
		
		i_clock => i_Gclock,
		i_loadA => '0',
		i_loadB => '0',
		i_enableA => '0',
		i_enableB => '0',
		i_ENProduct => '0',
		
		i_pSel => int_z,
		o_b0 => int_b0,
		o_z =>int_z,
		
		o_product(0) => int_mult(0),
		o_product(1) => int_mult(1),
		o_product(2) => int_mult(2),
		o_product(3) => int_mult(3),
		o_product(4) => int_mult(4),
		o_product(5) => int_mult(5),
		o_product(6) => int_mult(6),
		o_product(7) => int_mult(7),
		o_pcarry => int_prodcarry
	);
	mydiv: divider4b
	PORT map(
	i_clock => i_Gclock,
	i_aReg => i_a,
	i_lsA => '0', 
	i_bReg => i_b,
	i_rsel => '0',
	o_remainder => int_div1, --4-7
	i_lsR => '0',
	o_Quotiant => int_div0); -- 0-3
	
	
	o_add(0) <= int_addsub(0);
	o_add(1) <= int_addsub(1);
	o_add(2) <= int_addsub(2);
	o_add(3) <= int_addsub(3);
	o_add(4) <= '0';
	o_add(5) <= '0';
	o_add(6) <= '0';
	o_add(7) <= '0';
	
	o_sub(0) <= int_addsub(0);
	o_sub(1) <= int_addsub(1);
	o_sub(2) <= int_addsub(2);
	o_sub(3) <= int_addsub(3);
	o_sub(4) <= '0';
	o_sub(5) <= '0';
	o_sub(6) <= '0';
	o_sub(7) <= '0';
	
	o_mult(0) <= int_mult(0);
	o_mult(1) <= int_mult(1);
	o_mult(2) <= int_mult(2);
	o_mult(3) <= int_mult(3);
	o_mult(4) <= int_mult(4);
	o_mult(5) <= int_mult(5);
	o_mult(6) <= int_mult(6);
	o_mult(7) <= int_mult(7);
	
	o_div(0) <= int_div0(0);
	o_div(1) <= int_div0(1);
	o_div(2) <= int_div0(2);
	o_div(3) <= int_div0(3);
	o_div(4) <= int_div1(0);
	o_div(5) <= int_div1(1);
	o_div(6) <= int_div1(2);
	o_div(7) <= int_div1(3);

-- carry 	
 carry : mux4to1
 --00:ADD, 01: SUB, 10:Mult, 11:DIV
	PORT MAP(
		i_sel => i_opSel,
		i_m(0) => int_addsubCarry,
		i_m(1) => int_addsubCarry,
		i_m(2) => int_prodcarry,
		i_m(3) => '0',
		o_d => o_carry);
-- overflow
 overflow : mux4to1
 --00:ADD, 01: SUB, 10:Mult, 11:DIV
	PORT MAP(
		i_sel => i_opSel,
		i_m(0) => (int_addsubCarry and int_addsub(3)),
		i_m(1) => (int_addsubCarry and int_addsub(3)),
		i_m(2) => (int_prodcarry and int_mult(7)),
		i_m(3) => '0',
		o_d => o_of);
		
END myALU_a;

