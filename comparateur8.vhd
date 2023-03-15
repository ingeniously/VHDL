library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_signed.all; 
entity comp is 
 port( A : in std_logic_vector(7 downto 0); 
 B : in std_logic_vector(7 downto 0); 
 S1 : out std_logic; 
 S2: out std_logic; 
 S3 : out std_logic); 
end comp; 
architecture comporte of comp is 
begin 
 process(A, B) begin 
 if (A > B) then 
 S1 <= '1'; 
 S2 <= '0'; 
 S3 <= '0'; 
 	elsif (A < B) then 
 	S1 <= '0'; 
	S2 <= '1'; 
 	S3 <= '0'; 
	 	else 
 		S1 <= '0'; 
 		S2 <= '0'; 
 		S3 <= '1'; 
 end if; 
 end process; 
end comporte ;