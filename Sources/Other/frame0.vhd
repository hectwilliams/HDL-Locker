
--********************************************************************
-- File Name:  frame0.vhd
-- Creator:    Hector Williams
-- Date   :    June 2018
-- ****************************************************************************


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library tb_Lib;
use tb_Lib.frame0_Pkg.all;
use tb_Lib.COMPONENTS_Pkg.all;

entity frame0 is
generic(
	read_data_file      : boolean := false; 
	idx					: integer   
);
 port(
	clk			: in  		std_logic;
	reset 		: in  		std_logic; 
	sof_o		: out 		std_logic;
	eof_o		: out 		std_logic;
	rdy_o		: in 		std_logic;
	data_o		: out	 	std_logic_vector(127 downto 0);
	valid_o		: out 		std_logic;
	run_pulse	: in 		boolean  

);
end  frame0;

architecture rtl of frame0 is


-- constant SAMPLES_NUM : integer :=8; 
-- type   T_sm_state        is (idle, wr_data, wr_done);  
-- signal curr_state        	: 	T_sm_state := idle ;
 -- signal next_state        	: 	T_sm_state:= idle ;
 
signal sof_tb, sof_tb_q 					:	std_logic := '0'; 
signal eof_tb 	, eof_tb_q			:	std_logic :='0'; 
signal valid_tb,valid_tb_q 			: 	std_logic := '0';
signal data_tb 				: std_logic_vector(127 downto 0):=(others=>'0');
signal index			: 	integer := 0; 



 REQUEST FOR CODE !!!



end rtl;
 