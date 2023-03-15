library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Horloge_reset is 
      port(
     H:in std_logic;   
     R:in std_logic;  
     S: inout std_logic_vector(4 downto 1):="0000");
end Horloge_reset;

architecture behavioral of Horloge_reset is
begin
   process(H,R) 
      begin
        if (R='1') then
             S<="0000";
        elsif (H'event and H='1') then
             S <=STD_lOGIC_VECTOR(UNSIGNED(S+1));
        end if;
   end process;
end behavioral;
             