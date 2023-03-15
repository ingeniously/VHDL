library ieee;
use ieee.std_logic_1164.all;

entity mux_case is 
      port(
    E: in std_logic_vector(4 downto 1);
    SEL: in std_logic_vector(1 downto 0);
    S:out std_logic);
end mux_case;

architecture behavioral of mux_case is
begin
   process(E,SEL) is
      begin
        case SEL is
          when "00" =>S<=E(1);
          when "01" =>S<=E(2);
          when "10" =>S<=E(3);
          when others =>S<=E(4);

           S<=E(4);
        end case;
   end process;
end behavioral;
             