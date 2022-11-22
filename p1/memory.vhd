----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:03:25 10/30/2022 
-- Design Name: 
-- Module Name:    memory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory is
    Port ( clock : in std_logic;
            address : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_write : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_read : in  STD_LOGIC;
           read_data : out  STD_LOGIC_VECTOR (31 downto 0));
end memory;

architecture Behavioral of memory is
		type memoryFile is array(0 to 31) of std_logic_vector(31 downto 0);
		signal memory : memoryFile;

begin
    
    process(clock , address , mem_write , write_data , mem_read )
        begin
				memory(0) <= "00000000000000000000000000000011";
            if rising_edge(clock) then 
                if mem_write='1' then 
                    memory(to_integer(unsigned(address))) <= write_data ;
                end if;
                if mem_read='1' then
                    read_data <= memory(to_integer(unsigned(address)));
                end if ;
            end if;
        end process;


end Behavioral;

