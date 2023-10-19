--Lab1 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SRLatch IS
	PORT(
		i_s:IN STD_LOGIC;
		i_r:IN STD_LOGIC;
		i_EnLatch: IN STD_LOGIC;
		o_qLacth: OUT STD_LOGIC;
		o_qbarLacth: OUT STD_LOGIC);	
END SRLatch;

Architecture SRLatch_a OF SRLatch IS

	SIGNAL int_s, int_r :STD_LOGIC;
	SIGNAL int_q, int_qBar : STD_LOGIC;

BEGIN
	int_s <= (i_s nand i_EnLatch);
	int_r <= (i_r nand i_EnLatch);
	o_qLacth <= int_q;
	o_qBarLacth <= int_qBar;
	int_q <= (int_s nand int_qBar);
	int_qbar <= (int_r nand int_q);

END SRLatch_a;