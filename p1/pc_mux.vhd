----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:13 11/14/2022 
-- Design Name: 
-- Module Name:    pc_mux - Behavioral 
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

entity pc_mux is
    Port ( pc_4 : in  STD_LOGIC_VECTOR (31 downto 0);
           immediate : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
		   top : out std_logic;
           output1 : inout  STD_LOGIC_VECTOR (31 downto 0));
end pc_mux;

architecture Behavioral of pc_mux is

begin
	process(sel, pc_4 , immediate)
	begin 
		if(sel='0') then 
			output1 <= pc_4 ;
		end if;
		if(sel='1') then 
			output1 <= immediate ;
		end if;
	end process;


end Behavioral;

