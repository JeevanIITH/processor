----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:23 10/30/2022 
-- Design Name: 
-- Module Name:    mux_mem - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_mem is
    Port ( mem : in  STD_LOGIC_VECTOR (31 downto 0);
           alu : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_to_reg : in  STD_LOGIC;
           to_reg : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_mem;

architecture Behavioral of mux_mem is

begin
    process(mem_to_reg , alu , mem )
    begin 
        if mem_to_reg='0' then 
            to_reg <= alu ;
        end if;
		  if mem_to_reg='1' then 
            to_reg <= mem ;
        end if;
    end process;
	


end Behavioral;

