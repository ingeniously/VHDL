library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity test_Bench_Bascule_D is 
 
end test_Bench_Bascule_D;

architecture tb of test_Bench_Bascule_D is
signal  clk_t,Reset_t,D_t,set_t,S_t: std_logic;
signal clk_ena: boolean := false ;
constant clk_int: time:=100 ns;
begin
DUT: entity work.BasculeD(behavioral) 
      port map(
    clk=> clk_t,
    Reset=> Reset_t,
    set=>set_t,
    D=> D_t,
    S=> S_t);

clk_t<= not clk_t after clk_int/2 when clk_ena else '0';

parn: process
begin
clk_ena <= true;
Reset_t<= '0';
set_t<= '0';
D_t<='0';
wait until rising_edge(clk_t);
Reset_t<= '0';
set_t<= '1';
D_t<='1';
wait until rising_edge(clk_t);
Reset_t<= '1';
set_t<= '0';
D_t<='1';
wait until rising_edge(clk_t);
Reset_t<= '0';
set_t<= '0';
D_t<='1';
wait for 6*clk_int;
clk_ena <= false;
wait;
end process;

end tb;
             