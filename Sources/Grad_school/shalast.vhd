
--********************************************************************
-- File Name:  shalast.vhd
-- Creator:    Hector Williams
-- Date   :    Summer 2013
-- ****************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use ieee.std_logic_unsigned.all; 

 entity sha1 is 
 port(
clk: in std_logic;
di_vld: in std_logic; 
do_rdy: out std_logic;
 clr: in std_logic;
  seg_a : out std_logic;
    seg_b : out std_logic;
  seg_c : out std_logic;
  seg_d : out std_logic;
  seg_e : out std_logic;
  seg_f : out std_logic;
  seg_g : out std_logic;
AN: out std_logic_vector(3 downto 0)
      ); 
end sha1;

architecture do of sha1 is
  signal LED_flash_cnt: std_logic_vector(6 downto 0);

 signal count: std_logic_vector(31 downto 0);

 signal hex_digit_i: std_logic_vector(3 downto 0);

 signal rho,pi: std_logic_vector(1599 downto 0);
 signal state_ini: std_logic_vector(1599 downto 0);
signal state_reg1,state_reg2, state_reg3, state_reg4,state_reg5,
state_reg6,
state_reg7,
state_reg8,
state_reg9,
state_reg10,
state_reg11,
state_reg12,
state_reg13,
state_reg14,
state_reg15,
state_reg16,
state_reg17,
state_reg18,
state_reg19,
state_reg20,
state_reg21,
state_reg22,
state_reg23,
state_reg24,
state_reg25: std_logic_vector( 63 downto 0); 
 signal state_reg ,state_regb : std_logic_vector(1599 downto 0); 
 signal final_state: std_logic_vector(63 downto 0); 
 signal state0: std_logic_vector(1599 downto 0);
 signal cstrait: std_logic_vector(63 downto 0); 
signal wea: std_logic_vector( 0 downto 0);
signal addra :  STD_LOGIC_VECTOR(4 DOWNTO 0);

    signal dina :  STD_LOGIC_VECTOR(63 DOWNTO 0);
    signal douta : STD_LOGIC_VECTOR(63 DOWNTO 0);

signal c0,c1,c2,c3,c4,D0,D1,D2,D3,D4: std_logic_vector(63 downto 0); 
signal A,B: std_logic_vector(1599 downto 0);
signal rot_by_Cyclic: std_logic_vector(1599 downto 0); 
signal Chi_output: std_logic_vector(1599 downto 0); 
 signal statenew: std_logic_vector(1599 downto 0); 
 signal iota_out: std_logic_vector(63 downto 0); 

	
							
							
-------------------------------------------------------------------------------
--ABSORPTION
--  Initiliazation


 Type statetype is( st_idle, st_init, st_absorbi,pad , 
round0,
round1,
round2,
round3,
round4,
round5,
round6,
round7,
round8,
round9,
round10,
round11,
round12,
round13,
round14,
round15,
round16,
round17,
round18,
round19,
round20,
round21,
round22,
round23,
round24,
padend, 
st_ready);
signal state :statetype;
  
 
	  
	  
  -------------------------------------------------------------------------------------------------------------------------------------------
  begin 
  
  wea<="1"; 
  
  
  --INPUT MESSAGE
  state0<= 	(
   X"C1ECFDFC01000000" &
   -- X"0000000000000000" &
X"0000000000000000" &

X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" & 
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000080" &  
X"0000000000000000" & 
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" &
X"0000000000000000" );

  
  
  
  
--THETA STEP   
 
state_reg<= 
state_reg1 
& state_reg2 
& state_reg3 
& state_reg4 
& state_reg5 
& state_reg6
& state_reg7
& state_reg8
& state_reg9
& state_reg10
& state_reg11
& state_reg12
& state_reg13
& state_reg14
& state_reg15
& state_reg16
& state_reg17
& state_reg18
& state_reg19
& state_reg20
& state_reg21
& state_reg22
& state_reg23
& state_reg24
& state_reg25; 


--THETA STEP
    C0<= state_reg1 xor state_reg6 xor state_reg11 xor state_reg16 xor state_reg21;
    C1<= state_reg2 xor state_reg7 xor state_reg12 xor state_reg17 xor state_reg22;
    C2<= state_reg3 xor state_reg8 xor state_reg13 xor state_reg18 xor state_reg23;
    C3<= state_reg4 xor state_reg9 xor state_reg14 xor state_reg19 xor state_reg24;
    C4<= state_reg5 xor state_reg10  xor state_reg15 xor state_reg20 xor state_reg25;


REQUEST FOR REMAINING MODULE CODE !!!



	

  
  end do;