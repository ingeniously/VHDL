library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity BasculeD is 
      port(
    clk:in std_logic;
    Reset:in std_logic;
    set:in std_logic;
    D:in std_logic;
    S: out std_logic);
end BasculeD;

architecture behavioral of BasculeD is
begin
   process(D,clk,set,Reset) 
      begin
         if Reset='1' then
             S<='0';
       
         elsif set='1' then
             S<='1';
          
          elsif (clk'event and clk='1') then
              S <=D;
          end if;
end process;
end behavioral;
             