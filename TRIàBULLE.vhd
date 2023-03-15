library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_signed.all;

entity BubbleSort is
    Port ( clk : in std_logic;
           reset : in std_logic;
           start : in std_logic;
           input : in integer range 0 to 255;
           output : out integer range 0 to 255;
           done : out std_logic);
end BubbleSort;

architecture Behavioral of BubbleSort is
    type int_array is array(0 to 9) of integer range 0 to 255;
    signal data : int_array := (others => 0);
begin

    process (clk, reset)
        variable temp : int_array;
        variable swapped : boolean := true;
        variable i : integer range 0 to 8;
        variable current_element : integer range 0 to 255;
    begin
        if (reset = '1') then
            data <= (others => 0);
            done <= '0';
        elsif (rising_edge(clk)) then
            if (start = '1') then
                data(0) <= input;
            end if;
            temp := data;
            if (swapped) then
                swapped := false;
                for i in 0 to 7 loop
                    if (temp(i+1) < temp(i)) then
                        current_element := temp(i);
                        temp(i) := temp(i+1);
                        temp(i+1) := current_element;
                        swapped := true;
                    end if;
                end loop;
            else
                done <= '1';
                data <= temp;
            end if;
            output <= temp(9); -- sortie de l'élément trié le plus grand
        end if;
    end process;

end Behavioral;
