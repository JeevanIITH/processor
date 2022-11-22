----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:06:09 11/16/2022 
-- Design Name: 
-- Module Name:    pc_main - Behavioral 
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

entity pc_main is
    Port ( pc_in : inout  STD_LOGIC_VECTOR (31 downto 0);
				clock : in std_logic ;
				go_next : in std_logic ;
				update : in std_logic ;
				pc_write : in std_logic ;
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
end pc_main;

architecture Behavioral of pc_main is

	signal pc_register : std_logic_vector( 31 downto 0 ) ;
	signal pc_store_register : std_logic_vector (31 downto 0 ) ;

begin

	process(clock , pc_in , go_next , pc_write )
	begin 
		if ( rising_edge(clock) ) then 
			if(pc_write='1') then
				pc_store_register <= pc_in;
			end if;
			if(go_next='1') then
				pc_out<=pc_register ;
			end if;
			if (update='1') then 
				pc_register<=pc_store_register;
			end if;
		end if;
	
	end process;


end Behavioral;

