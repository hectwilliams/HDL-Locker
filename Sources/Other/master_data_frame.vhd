
--********************************************************************
-- File Name:  master_data_frame.vhd
-- Creator:    Hector Williams
-- Date   :    June 2018
-- ****************************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library tb_Lib;
use tb_Lib.frame0_Pkg.all;
use tb_Lib.COMPONENTS_Pkg.all;
use tb_lib.Beamformer0_Pkg.all; 
use tb_Lib.weights0_Pkg.all ;

entity master_data_frame is
generic(
	counter_value					: integer ;
	weights_en							: boolean 

	
);
 port(
	clk					: in  		std_logic;
	reset 				: in  		std_logic; 
	Soc_Slv_A     		: out    	std_logic_vector(31 downto 0) := (others=>'0');  --byte address
	Soc_Slv_D     		: out    	std_logic_vector(31 downto 0);
	Soc_Slv_Q     		: in    	std_logic_vector(31 downto 0);
	Soc_Slv_Wr    		: out    	std_logic:='0';
	Soc_Slv_Rd    		: out    	std_logic:='0';
	Soc_Slv_Wait  		: in   		std_logic;
    Soc_Slv_Dval  		: in   		std_logic;   --done read flag 
	run_pulse			: in 		boolean  ;
	run_pulse_ready		: out 		boolean  ;
	send_stream_pulse 	: out 		boolean ;
	
	beamform_src_eof	: in 		std_logic
	
);
end  master_data_frame;

architecture rtl of master_data_frame is

 
signal sof_tb  										:	std_logic:= '0' ; 
signal eof_tb 										:	std_logic:= '0' ; 
signal valid_tb,valid_tb_q 							: 	std_logic:= '0' ;
signal data_tb 										: std_logic_vector(127 downto 0):=(others=>'0');
signal counter_latch, counter_latch_weights	,counter_latch_weights2,counter_latch_skip_Count		: 	integer := 0; 
signal weights_run,weights_ready, skip_counter_ready				:  boolean := false ;


signal sof_tb_weights	,sof_tb_weights2	 						:	std_logic:= '0' ; 
signal eof_tb_weights 								:	std_logic:= '0' ; 
signal valid_tb_weights,valid_tb_weights_q 							: 	std_logic:= '0' ;

signal Soc_Slv_Rd_q, Soc_Slv_Rd_q2,Soc_Slv_Rd_q3,cpy_skip: std_logic := '0'; 

signal read_trig,read_trig_q : std_logic:= '0' ; 

signal sof_skip_Count	 						:	std_logic:= '0' ; 
signal eof_skip_Count 								:	std_logic:= '0' ; 
signal valid_skip_Count 							: 	std_logic:= '0' ;
signal wr_weights_process_en	,Soc_Slv_Rdq			: std_logic:= '0' ; 
signal counter: integer :=0; 
signal Soc_Slv_Dval_bool : boolean  := false ;
signal row_shitx : std_logic_vector( 8 downto 0):=(others=>'0');
signal row_shity : std_logic_vector( 5 downto 0):=(others=>'0');
constant CONSTANT_ONE : integer:= 1; 
signal ram_lane_count : integer range 0 to 15:=0	; 
signal  ram_address_count: integer range 0 to 15:= 0 ; 



--state machine  
 type state_t is(
ST_IDLE,
START,
WRITE_RAM_WEIGHT,
INCR_ADDRESS_LOOPBACK_WRITE_RAM,
WRITE_CM_CONTROL,
PAUSE,
SEND_STREAM,
READ_FIFO, 
ST_WAIT
  );

  signal state_d,  state_q: state_t := ST_IDLE; 
  
  
begin 


U_CounterBlock_master_frame: CounterBlock
generic map( PARAM_COUNT  => counter_value    , 
			 INIT_COUNT_VALUE => 0    			 ) 
 port map(
	clk				=> 			clk 					,
	counter_o 		=>    		counter_latch          	,
	sof_o			=>       	sof_tb       			,
	eof_o			=>     	 	eof_tb        			,
	run_i			=>			run_pulse 				,
	valid_o			=>			valid_tb				,
	wait_in 		=> 			Soc_Slv_Wait			
);


U_weight_data_CounteBlock_frame: CounterBlock
generic map( 	PARAM_COUNT  => 32 +CONSTANT_ONE ,
				INIT_COUNT_VALUE  => 0   ) 
 port map(
	clk				=> 				clk 					,
	counter_o 		=>    		   counter_latch_weights       	,
	sof_o			=>       	 sof_tb_weights      			,
	eof_o			=>     	 	eof_tb_weights        			,
	run_i			=>			weights_run 				,
	valid_o			=>			valid_tb_weights				,
	wait_in 		=> 			Soc_Slv_Wait 			
);


Boolean_Master_Read_Enable : process(all)
begin

	if(Soc_Slv_Dval ='1') then 
		Soc_Slv_Dval_bool <= true;
	else
		Soc_Slv_Dval_bool <=  false; 
	end if; 
end process ; 





tb_state_machine : process( reset, clk) 
variable  CONSTANT_FOUR: unsigned( 31 downto 0 ):= x"00000040"; 		
variable  NUM_RAM_BLOCK_ENABLED: integer 		:= 2; 			
variable  testcomplete: boolean 		:= false; 			

begin

if( reset ='1' ) then 
	state_d<= ST_IDLE; 
elsif(rising_edge(clk)) then 

	case (state_d) is
		when ST_IDLE 			=> 
		if(testcomplete= false) then 
			weights_run<= false;
			wr_weights_process_en<='0';
			row_shitx(0)<='1';
			row_shitx(8 downto 1) <= row_shitx( 7 downto 0);
			if( row_shitx(8)  ) then  					--shift reg to delay 'lazy'
				state_d<= WRITE_RAM_WEIGHT;
				row_shitx<= (others=>'0') ; 
			end if; 		
		end if; 
	when WRITE_RAM_WEIGHT		=> 						

			if(weights_run = false and wr_weights_process_en='0')	  	then 
				weights_run<= true;
				wr_weights_process_en<= '1' ;									
				Soc_Slv_A<= (others=>'0') ; 




			
 REQUEST FOR CODE !!!



end rtl;
 
 

