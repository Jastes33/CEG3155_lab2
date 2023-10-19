--Lab1 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY myDFF IS
	PORT(
		i_d:IN STD_LOGIC;
		i_clock:IN STD_LOGIC;
		o_qDFF: OUT STD_LOGIC;
		o_qbarDFF: OUT STD_LOGIC);	
END myDFF;

Architecture myDFF_a OF myDFF IS

	SIGNAL int_qBarDFF, int_qDFF :STD_LOGIC;
	SIGNAL int_qBarDFFs, int_qDFFs :STD_LOGIC;

	

	component SRLatch
	PORT(	
		i_s:IN STD_LOGIC;
		i_r:IN STD_LOGIC;
		i_EnLatch: IN STD_LOGIC;
		o_qLacth: OUT STD_LOGIC;
		o_qbarLacth: OUT STD_LOGIC);
	END component;
	
Begin

	masterSRLATCH : SRLatch
	PORT MAP(
	i_s => i_d,
	i_r => (not i_d),
	i_EnLatch => (not i_clock),
	o_qLacth => int_qDFF,
	o_qBarLacth => int_qBarDFF
	);
	
	slaveSRLATCH : SRLatch
	PORT MAP(
	i_s => int_qDFF,
	i_r => int_qBarDFF,
	i_EnLatch => i_clock,
	o_qLacth => int_qDFFs,
	o_qBarLacth => int_qBarDFFs
	);
	
	o_qDFF <= int_qDFFs;
	o_qBarDFF <= int_qBarDFFs;

END myDFF_a;