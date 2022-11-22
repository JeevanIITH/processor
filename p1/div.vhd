----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:21 06/25/2022 
-- Design Name: 
-- Module Name:    a - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity a is

	port (			clock:in std_logic;
						d: in std_logic_vector(3 downto 0);
						m:in std_logic_vector(3 downto 0);
						q:out std_logic_vector(3 downto 0);
						enable: in std_logic
					);
end a;

architecture Behavioral of a is
	signal reg1:std_logic_vector(3 downto 0):="0000";
	signal reg2:std_logic_vector(3 downto 0):="0000";
	signal reg_q:std_logic_vector (3 downto 0):="0000";
	signal m_s:std_logic_vector (3 downto 0):="0000";

begin
	process(clock,m,d , enable )
	variable c:integer:=3;
	variable i:integer:=3;
	variable t:std_logic_vector(3 downto 0):="0000";
	
	begin
		
		if ( rising_edge(clock) and enable='1')  then
			
			t:=(reg1(2 downto 0) & m(i));
			if ( t >= d ) then
				reg2<=t(3 downto 0)-d(3 downto 0);
				reg_q<=reg_q(2 downto 0) & '1';
				
				i:=i-1;
				c:=c-1;
				if ( c<0 ) then 
					q<=reg_q(2 downto 0) & '1';
				end if;
				
			else
				reg2<=t(3 downto 0)-"0000";
				reg_q<=reg_q(2 downto 0) & '0';
				i:=i-1;
				c:=c-1;
				if ( c<0 ) then 
					q<=reg_q(2 downto 0) & '0';
				end if;
				
				
			end if;
			
			
		elsif falling_edge(clock) then
			reg1<=reg2;
		end if;
	end process;


end Behavioral;

