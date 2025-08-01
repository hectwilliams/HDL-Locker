
--********************************************************************
-- File Name:  test2.vhd
-- Creator:    Hector Williams
-- Date   :    Summer 2013
-- ****************************************************************************

LIBRARY IEEE;
USE STD.TEXTIO.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_1164.ALL; 
ENTITY square IS    
  PORT( go : IN std_logic); 
END square; 

ARCHITECTURE simple OF square IS 
BEGIN    
  PROCESS(go)        
    FILE infile : TEXT IS IN "E:\FPGA STUFF\FPGA\dd.txt";
      
    FILE outfile : TEXT IS OUT "E:\FPGA STUFF\FPGA\output.txt";
       
    VARIABLE out_line, my_line : LINE;        
    VARIABLE int_val : INTEGER;    
  BEGIN        
    WHILE NOT( ENDFILE(infile)) LOOP               
      -- read a line from the input file          
      READLINE( infile, my_line);     
      -- read a value from the line            
      READ( my_line, int_val);            
      -- square the value            
      int_val := int_val **2;            
      -- write the squared value to the line
      WRITE( out_line, int_val);            
      -- write the line to the output file
      WRITELINE( outfile, out_line);        
    END LOOP;    
  END PROCESS; 
END simple;

