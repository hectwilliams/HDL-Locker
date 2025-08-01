--********************************************************************
-- File Name:  1553_TB.vhd
-- Creator:    Hector Williams
-- Date   :    Fall 2017
-- Description:
--   This file tests a 1553 decoder 
-- ****************************************************************************

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_unsigned.all;
USE std.textio.all; 
USE ieee.numeric_std.ALL; 
use ieee.math_real.all;
USE ieee.std_logic_textio.all; 

entity test_1553 is
end entity test_1553;

ARCHITECTURE do_it OF test_1553 IS

-- COMPONENT Decoder_1553 
-- PORT(
-- i_RESET_N        : IN  std_logic;
-- i_DATA_CLK       : IN  std_logic;
-- i_ENABLE_DECODER : IN  std_logic;
-- i_BLOCK_NUMBER   : IN  unsigned(39 downto 0);
-- i_RX_DATA        : IN  std_logic;
-- i_RX_DATA_N      : IN  std_logic;
-- i_PACKET_HOLD    : IN  std_logic;
-- o_MSG_COUNT      : OUT unsigned(15 downto 0);
-- o_DECODE_VALID   : OUT std_logic;
-- o_DECODE_DATA    : OUT unsigned(19 downto 0)
-- );
-- End COMPONENT;

--Internal 
constant clk_period:	time:=	1000 ns;       -- bit time
constant NUM_COLUMNS: 	integer  :=16;     
constant sample_time:	time:=	clk_period/2;     
constant UPCONVERT_SAMPLE:  integer:= 10; 
constant sample_time_1553_decode:	time:=	sample_time/UPCONVERT_SAMPLE;     
constant COLUMN_SIZE_EXCLUDE_SYNC:  integer:= 6+2*(NUM_COLUMNS+1) ;
constant BUFFER_SIZE : integer:= 11;   
constant SyncBitTotal_1MHZ_Sample: integer:= 6;					--sample time=.5
constant DataBitTotalPlusParity_1MHZ_Sample: integer:= 17*2;

--1553 Signals
signal tb_RESET_N : std_logic := '1'  ; 
signal tb_DATA_CLK : std_logic :='0' ;   
signal tb_ENABLE_DECODER: std_logic:='0'; 
signal tb_BLOCK_NUMBER : unsigned( 39 downto 0):= (others=>'0')  ;
signal tb_RX_DATA  :   std_logic:='0'  ;
signal tb_RX_DATA_N :  std_logic:='0'  ;
signal tb_PACKET_HOLD:  std_logic:='0'  ;
signal tb_MSG_COUNT  :   unsigned( 15 downto 0);
signal tb_DECODE_VALID :  std_logic;
signal tb_DECODE_DATA: unsigned(19 downto 0) ;

--random generate
signal rand_bit : std_logic; 
signal rand_bit2 : std_logic; 
signal value1_std_logic_8_bit : unsigned( 7 downto 0) ; 
signal value2_std_logic_8_bit : unsigned( 7 downto 0) ; 
type data_from_file is array ((NUM_COLUMNS-1) downto 0) of integer   ;
--signal word_data             : data_from_file := (others=>0 ) ;
signal word_data: unsigned(15 downto 0); 
signal bit_stream_data: std_logic_vector(COLUMN_SIZE_EXCLUDE_SYNC-1 downto 0); 

signal bit_stream_valid : boolean; 
signal valid,valid_3_dly, valid_2_dly,valid_dly21_upcon : boolean := false ; 
signal line_cnt : integer:=0; 
signal  bus1553Words: unsigned(15 downto 0):= (others=>'0'); 

--bucket
type buf_t is array (BUFFER_SIZE downto 0) of unsigned( COLUMN_SIZE_EXCLUDE_SYNC*UPCONVERT_SAMPLE-1 downto 0);
signal buffer_z: buf_t ; 
signal buffer_full: boolean:=  false ;
signal buf_count : integer:= 0 ; 
signal block_trig: boolean := false;
signal block_done: boolean := false;
type word_pack is array (3 downto 0) of unsigned(3 downto 0); 
--state machine  
type state_t is(
ST_IDLE,
ST_READ_1553_DATA,
ST_WRITE_TO_BUFFER,
ST_STREAM_BIT, 
STREAM_COMPLETE,
ST_WAIT
);
signal state_z         : state_t;



REQUEST FOR CODE !!!


end do_it; 