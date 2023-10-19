--Lab2 Group 3 CEG3155
--Jessica Hemstead 300214909
--Alexander Wilson 300219585

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY zerotest IS
	PORT(
		i_in:IN STD_LOGIC_VECTOR(0 to 7);
		o_d: OUT STD_LOGIC);
END zerotest;

Architecture zerotest OF zerotest IS



BEGIN
	
	
	o_d <= (((((((i_in(0) nor i_in(1)) nor i_in(2)) nor i_in(3)) nor i_in(4)) nor i_in(5)) nor i_in(6)) nor i_in(7));


END zerotest;