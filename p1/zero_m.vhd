----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:47 11/16/2022 
-- Design Name: 
-- Module Name:    zero_m - Behavioral 
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

entity zero_m is
    Port ( r : in  STD_LOGIC_VECTOR (31 downto 0);
			clock : in std_logic;
			top: out std_logic;
           zero : out  STD_LOGIC);
end zero_m;

architecture Behavioral of zero_m is

begin
	process(r)
	begin 
		if(rising_edge(clock) and r="00000000000000000000000000000000") then 
			zero<='1';
		end if;
	end process;


end Behavioral;

