----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:13:28 11/12/2022 
-- Design Name: 
-- Module Name:    demux - Behavioral 
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

entity demux is
    Port ( sel : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end demux;

architecture Behavioral of demux is

begin
	process(sel)
	begin
		case sel is 
		when "0000"=> output <= std_logic_vector(to_unsigned(1, output'length));--and
		when "0001"=> output <= std_logic_vector(to_unsigned(2, output'length));--or
		when "1110"=> output <= std_logic_vector(to_unsigned(4, output'length));--xor
		when "0010"=> output <= std_logic_vector(to_unsigned(8, output'length)); -- adder 
		when "0011"=> output <= std_logic_vector(to_unsigned(16, output'length)); --mult
		when "0111" => output <= std_logic_vector(to_unsigned(32, output'length)); --div
		when others => output <= std_logic_vector(to_unsigned(256, output'length));
		end case ;
	end process;

end Behavioral;

