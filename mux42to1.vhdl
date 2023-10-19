-- 8 bit 2 to 1 mux
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY mux42to1 IS
	PORT(
		i_op0:IN STD_LOGIC_vector(0 to 3);
		i_op1:IN STD_LOGIC_vector(0 to 3);
		i_selection: IN STD_LOGIC;
		o_choice:OUT STD_LOGIC_vector(0 to 3));
END mux42to1;

Architecture mux42to1 OF mux42to1 IS

component my2to1
	port(
		i_op0:IN STD_LOGIC;
		i_op1:IN STD_LOGIC;
		i_selection: IN STD_LOGIC;
		o_choice:OUT STD_LOGIC);
end component;	

BEGIN
	a: my2to1
	port map(
		i_op0 => i_op0(0),
		i_op1 => i_op1(0),
		i_selection => i_selection,
		o_choice => o_choice(0));
	b:my2to1
	port map(
		i_op0 => i_op0(1),
		i_op1 => i_op1(1),
		i_selection => i_selection,
		o_choice =>  o_choice(1));
	c:my2to1
	port map(
		i_op0 => i_op0(2),
		i_op1 => i_op1(2),
		i_selection => i_selection,
		o_choice => o_choice(2));
	d:my2to1
	port map(
		i_op0 => i_op0(3),
		i_op1 => i_op1(3),
		i_selection => i_selection,
		o_choice => o_choice(3));

END mux42to1;