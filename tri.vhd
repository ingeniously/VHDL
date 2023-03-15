library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_signed.all;

entity BubbleSort is
    port (
        input_clk : in std_logic;
        input_rst : in std_logic;
        input_data : in integer_vector(9 downto 0) := (1, 3, 5, 2, 4, 6, 8, 7, 10, 9);
        output_sorted_data : out integer_vector(9 downto 0) ;
        output_done : out std_logic
    );
end entity BubbleSort;

architecture Behavioral of BubbleSort is
    type int_array is array(0 to 9) of integer range 0 to 2**31-1;
    signal unsorted_data : int_array := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    signal sorted_data : int_array := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    signal i, j : integer range 0 to 9;
    signal temp : integer range 0 to 2**31-1;
    signal sorted : boolean := false;
begin

    process(input_clk)
    begin
        if rising_edge(input_clk) then
            if input_rst = '1' then
                sorted <= false;
                unsorted_data <= (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                sorted_data <= (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                output_sorted_data <= 0;
                output_done <= '0';
            else
                if not sorted then
                    for i in 0 to 9 loop
                        unsorted_data(i) <= input_data(i);
                    end loop;
                    sorted_data <= unsorted_data;
                    for i in 0 to 8 loop
                        for j in 0 to 8-i loop
                            if sorted_data(j+1) < sorted_data(j) then
                                temp <= sorted_data(j+1);
                                sorted_data(j+1) <= sorted_data(j);
                                sorted_data(j) <= temp;
                            end if;
                        end loop;
                    end loop;
                    output_sorted_data <= sorted_data(9);
                    sorted <= true;
                    output_done <= '1';
                end if;
            end if;
        end if;
    end process;

end architecture Behavioral;

