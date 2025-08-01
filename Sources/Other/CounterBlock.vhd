--********************************************************************
-- File Name:  CounterBlock.vhd
-- Creator:    Hector Williams
-- Date   :    June 2018
-- ****************************************************************************


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CounterBlock is
generic( PARAM_COUNT  : integer    ; 
	INIT_COUNT_VALUE : integer );

 port(
	clk				: in  		std_logic;
	counter_o 		: out  		integer; 
	sof_o			: out 		std_logic; 
	eof_o			: out		std_logic;
	run_i			: in 		boolean ; 
	valid_o			: out		std_logic := '0'    ;
	wait_in 		  : in 		std_logic := '0' 
);
end  CounterBlock;

architecture rtl of CounterBlock is

signal cnt: integer range 0 to 429496729:= INIT_COUNT_VALUE; 
signal run_hold: BOOLEAN;
begin 

process(clk)
begin 


 REQUEST FOR CODE !!!

end rtl ; 