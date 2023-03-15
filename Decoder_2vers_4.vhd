library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Decodeur is 
      port(
   E:in std_logic_vector(1 downto 0);
   S:out  std_logic_vector(3 downto 0)
);
end Decodeur;

architecture behavioral of Decodeur is

begin
   process(E) 
      begin
  case E is
          when "00" =>S<="0001";
          when "01" =>S<="0010";
          when "10" =>S<="0100";
	  when "11" =>S<="1000";
          when others =>S<="0000";
 end case;
   end process;
end behavioral;
             