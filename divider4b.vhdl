--4 bit divider
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY divider4b IS
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
END divider4b;

Architecture rtl of divider4b IS

	SIGNAL int_Rin, int_Ain: std_LOGIC_VECTOR(0 to 3); 
	SIGNAL int_Qin: std_LOGIC;
	SIGNAL int_adder: STD_LOGIC_VECTOR(0 to 3);
	SIGNAL int_Rout, int_Aout, int_rmout, int_qout: std_LOGIC_VECTOR(0 to 3);
	SIGNAL int_Bout: std_LOGIC_VECTOR(0 to 3);
	SIGNAL int_bin	: STD_LOGIC_VECTOR(0 to 3);
--left shift
	component shiftLEFT4b
		PORT(		i_sL:IN STD_LOGIC_VECTOR(0 to 3);
		i_Gclock:IN STD_LOGIC;
		i_shiftL: IN STD_LOGIC;
		i_Greset :IN STD_LOGIC;
		i_w :in std_LOGIC;
		o_kL: OUT STD_LOGIC_VECTOR(0 to 3));
	END component;
-- register
	component bit4reg
		PORT(
		i_s:IN STD_LOGIC_VECTOR(0 to 3);
		i_Gclock:IN STD_LOGIC;
		i_Greset :IN STD_LOGIC;
		o_DisplayOut: OUT STD_LOGIC_VECTOR(0 to 3));
	END component;
-- full 8 bit adder
	component full4bitADD
		PORT(
		i_xx, i_yy : IN STD_logic_vector(0 to 3);
		i_cinBit :IN STD_logic;
		o_s:OUT STD_logic_vector(0 to 3);
		o_c:OUT STD_logic);
	END component;
-- 2 to 1 mux
	component mux42to1
		PORT(
		i_op0:IN STD_LOGIC_VECTOR(0 to 3);
		i_op1:IN STD_LOGIC_VECTOR (0 to 3);
		i_selection: IN STD_LOGIC;
		o_choice:OUT STD_LOGIC_vector(0 to 3));
	END component;

BEGIN
--left shift R
	leftshiftR : shiftLEFT4b
	port map(
		i_sL => int_Rin,
		i_Gclock => i_clock,
		i_shiftL => i_lsR,
		i_Greset => '0',
		o_kL => int_Rout,
		i_w => int_Aout(3)
		);
		regmR : mux42to1
		PORT map(
		i_op0 => int_Rout,
		i_op1 => int_rmout,
		i_selection => i_lsr,
		o_choice => int_Rin);
--left shift A
	leftshiftA : shiftLEFT4b
	port map(
		i_sL => int_Ain,
		i_Gclock => i_clock,
		i_shiftL => i_lsA,
		i_Greset  => '0',
		o_kL => int_Aout,
		i_w => '0');
	regmA : mux42to1
		PORT map(
		i_op0 => i_aReg,
		i_op1 => int_Aout,
		i_selection => i_lsA,
		o_choice => int_Ain);
-- register B
	regB : bit4reg
	port map(
		i_s => i_bReg,
		i_Gclock => i_clock,
		i_Greset  => '0',
		o_DisplayOut => int_Bout);	
		
-- left shift Q
	leftshiftQ : shiftLEFT4b
	port map(
		i_sL => int_qout,
		i_Gclock => i_clock,
		i_shiftL  => '1', -- how??
		i_Greset  => '0',
		o_kL => int_qout,
		i_w => int_Qin);
	remmux : mux42to1
	port map(
		i_op0 => int_adder, -- how many bits
		i_op1 => (others => '0'),
		i_selection => i_rsel,
		o_choice =>	int_Rmout
		);
-- full 8 bit adder
	adder : full4bitADD
	port map(
		i_xx => int_Rout,
		i_yy => not int_Bout(0 to 3),
		i_cinBit => '1',
		o_s => int_adder,
		o_c => int_Qin
	);
	o_remainder <= int_Rout;
	o_areg <= int_Aout;
	o_quotiant <= int_qout;
END rtl; 