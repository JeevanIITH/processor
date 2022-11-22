----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:45:10 11/12/2022 
-- Design Name: 
-- Module Name:    add_enable - Behavioral 
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

entity add_enable is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           enable : in  STD_LOGIC;
           as : out  STD_LOGIC_VECTOR (31 downto 0);
           bs : out  STD_LOGIC_VECTOR (31 downto 0));
end add_enable;

architecture Behavioral of add_enable is

begin
	process(a,b,enable)
	begin 
		if(enable='0') then 
			as<="00000000000000000000000000000000";
			bs<="00000000000000000000000000000000";
		end if;
		if (enable='1') then 
			as<=a;
			bs<=b;
		end if;
	end process;


end Behavioral;

