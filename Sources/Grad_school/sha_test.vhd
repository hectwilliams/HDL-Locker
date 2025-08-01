--********************************************************************
-- File Name:  sha_test.vhd
-- Creator:    Hector Williams
-- Date   :    Summer 2013
-- ****************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use ieee.std_logic_unsigned.all; 
use work.txt_util.all;
use std.textio.all;
 use ieee.math_real.all;


 entity sha is 
 port(
clk,clr: in std_logic;
round_rdy:out std_logic;
di_vld: in std_logic; 
do_rdy: out std_logic;
 dout:out std_logic_vector(1599 downto 0)
      ); 
end sha;

architecture do of sha is
  signal test2,arg2,bit_size2,logbase2,logbase,bit_size,arg,test : integer;
  
  signal come: natural;
 signal kcount: std_logic_vector(7 downto 0); 
 signal count: std_logic_vector(31 downto 0);
 signal in_8:std_logic_vector(7 downto 0);
  signal in_16:std_logic_vector(15 downto 0);
  signal in_32:std_logic_vector(31 downto 0);

 signal mes,inputmes: std_logic_vector( 31 downto 0); 
 signal P,check,k: std_logic_vector(1599 downto 0);
 signal Pstart: std_logic_vector(1599 downto 0);
 signal rcount,rcount2: std_logic_vector(31 downto 0);
--- signal init2: 
 signal state_out_ini: std_logic_vector(1599 downto 0);
 signal state_ini: std_logic_vector(1599 downto 0);
 -- signal r: std_logic_vector(575 downto 0);    --bitrate
 -- signal c: std_logic_vector(1023 downto 0);   --capacity
 signal hexzero,o: std_logic_vector(31 downto 0);
 -- signal P_reg: std_logic_vector( 1151 downto 0);
 signal state_reg: std_logic_vector(1599 downto 0); 
 -- signal Pchange: std_logic_vector(575 downto 0); 
 -- signal P1: std_logic_vector(575 downto 0); 
 -- signal P2: std_logic_vector(575 downto 0);
 signal state0: std_logic_vector(1599 downto 0);
 --signal state1: std_logic_vector(1599 downto 0); 
   -- variable LEN: integer := mes;-- LEN has a value of 32 ;
signal wea: std_logic_vector( 0 downto 0);
signal addra :  STD_LOGIC_VECTOR(4 DOWNTO 0);
    signal dina :  STD_LOGIC_VECTOR(63 DOWNTO 0);
    signal douta : STD_LOGIC_VECTOR(63 DOWNTO 0);

 signal wea2: std_logic_vector( 0 downto 0);
signal addrA2 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
    signal dina2 :  STD_LOGIC_VECTOR(255 DOWNTO 0);
    signal douta2 : STD_LOGIC_VECTOR(255 DOWNTO 0);
signal c0,c1,c2,c3,c4,D0,D1,D2,D3,D4: std_logic_vector(63 downto 0); 
signal A: std_logic_vector(1599 downto 0);
signal  iota_output: std_logic_vector(63 downto 0); 
signal rot_by_Cyclic: std_logic_vector(1599 downto 0); 
signal Chi_output: std_logic_vector(1599 downto 0); 
 signal statenew: std_logic_vector(1599 downto 0); 
 signal iota_out: std_logic_vector(63 downto 0); 
 signal doutcheck:std_logic_vector(1599 downto 0); 
 --Round Constraints

   -- TYPE rom is array( 0 to 23) of std_logic_vector(63 downto 0);
  -- CONSTANT Cstrait :rom:= rom'(x"0000000000000000",X"0000000000000001", X"0000000000008082", X"800000000000808A",X"8000000080008000",
                               -- X"0000000080000001", X"8000000080008081", X"8000000000008009",X"000000000000008A",
							   -- X"0000000000000088" ,X"0000000080008009", X"000000008000000A",X"000000008000808B",
							   -- X"800000000000008B", X"8000000000008089", X"8000000000008003", X"8000000000008002",
							   -- X"8000000000000080", X"000000000000800A", X"800000008000000A",X"8000000080008081",
							   -- X"8000000000008080", X"0000000080000001", X"8000000080008008");

--Cyclic Shifts
	 -- TYPE rom2 is array( 1 to 25) of std_logic_vector(31 downto 0);
  -- CONSTANT cyc_shift :rom2:= rom2'(
  -- X"00000000", X"00000001", X"0000003E", X"0000001C", X"0000001b", 
  -- X"00000024", X"0000002C", X"00000006", X"00000037" ,X"00000014",
  -- X"00000003", X"0000000A", X"0000002B", X"00000019", X"00000027" ,
  -- X"00000029", X"0000002D", X"0000000F", X"00000015", X"00000008",
  -- X"00000012", X"00000002", X"0000003D", X"00000038", X"0000000E"  );					
							
							
							
-------------------------------------------------------------------------------
--ABSORPTION
--  Initiliazation


 Type statetype is( st_idle, st_init, st_absorbi, st_Kround, st_ready);
  signal state :statetype;







   REQUEST TO SEE FULL CODE !!

  
  
  end do;