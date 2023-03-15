library ieee ;
 use ieee.std_logic_1164.all ; 
entity parity is port ( E: in std_logic_vector (7 downto 0 );
                       S:out std_logic); 
end entity ; 
architecture archi of parity is 
begin 
process (E)  
variable V: std_logic; 
begin 
     V:= '0';
        for i in 0 to 7 loop 
            V:=V xor E(i); 
        end loop; 
            S <= V; 
   end process;
end archi;
