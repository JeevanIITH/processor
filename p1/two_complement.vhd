----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:18:15 11/12/2022 
-- Design Name: 
-- Module Name:    two_complement - Behavioral 
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
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity two_complement is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
				invert : in std_logic ;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end two_complement;

architecture Behavioral of two_complement is

begin
	process (invert , a ) 
	begin 
		if( invert ='1') then 
			output <= not(a) + "00000000000000000000000000000001";
		end if;
		if (invert ='0' ) then 
			output <= a ;
		end if;
	end process;



end Behavioral;

