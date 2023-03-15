library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Transcoder is 
      port(
    E: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(6 downto 0));
end Transcoder;


architecture behavioral of Transcoder is
begin
process(E)
  begin 
     case E is
        when "0000" => S<="1111110";
        when "0001" => S<="0110000";
        when "0010" => S<="1101111";
        when "0011" => S<="1111001";
        when "0100" => S<="0110011";
        when "0101" => S<="1011011";
        when "0110" => S<="1011111";
        when "0111" => S<="1110000";
        when "1000" => S<="1111111";
        when "1001" => S<="1111011";
        when others => S<="0000000";
     end case;
    end process;
end behavioral;

