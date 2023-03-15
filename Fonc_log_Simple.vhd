library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Fonc_log_Simple is 
      port(
    A:in std_logic;
    B:in std_logic;
    Y: out std_logic);
end Fonc_log_Simple;

architecture behavioral of Fonc_log_Simple is
signal C,D: std_logic;
begin
   process(A,B) 
      begin
   C<=not (B) and A;
   D<=not (A) and B;
   end process;
    Y<= D or C;
end behavioral;
             