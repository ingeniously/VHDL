library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity ALU is 
      port(
    A: in std_logic_vector(3 downto 1);
    B: in std_logic_vector(3 downto 1);
    OP: in std_logic_vector(2 downto 0);
    R: out std_logic_vector(3 downto 1));
end ALU;

architecture behavioral of ALU is
begin
   process(A,B,OP) is
      begin
        case OP is
          when "000"  =>R<=A+B;
          when "001"  =>R<=A-B;
          when "010"  =>R<=STD_lOGIC_VECTOR(UNSIGNED(A+1));
          when "011"  =>R<=STD_lOGIC_VECTOR(UNSIGNED(A-1));
          when "100"   =>R<=A and B;
          when "101"   =>R<=A or B;
          when "110"   =>R<=not A;
          when "111"   =>R<=A xor B;
          when others =>R<="000";

        end case;
   end process;
end behavioral;
             