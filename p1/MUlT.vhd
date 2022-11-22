----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:12:46 09/09/2022 
-- Design Name: 
-- Module Name:    MUlT - Behavioral 
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

entity MUlT is
    Port ( M : in  STD_LOGIC_VECTOR (31 downto 0);
           Q : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  enable : in std_logic;
           R : out  STD_LOGIC_VECTOR (31 downto 0));
end MUlT;

architecture Behavioral of MUlT is
signal sum:std_logic_vector(31 downto 0) ;
signal i:integer;
signal store:std_logic_vector(31 downto 0);
signal flag:std_logic;
begin


		
	process(M,Q,clk,reset,i, enable)
		begin
		if (enable='1') then 
		if (rising_edge(clk) and reset='1') then 
			sum<="00000000000000000000000000000000";
			R<="00000000000000000000000000000000";
			store<="00000000000000000000000000000000";
			i<=0;
			flag<='0';
			end if;
		if (i=32) then 
			sum<="00000000000000000000000000000000";
			R<="00000000000000000000000000000000";
			store<="00000000000000000000000000000000";
			i<=0;
			flag<='0';
		end if;
		if (rising_edge(clk) and reset='0') then 
				if ( Q(i)='0' ) then 
					R<=sum;
					i<=i+1;
						store(31)<=store(30);
						store(30)<=store(29);
						store(29)<=store(28);
						store(28)<=store(27);
						store(27)<=store(26);
						store(26)<=store(25);
						store(25)<=store(24);
						store(24)<=store(23);
						store(23)<=store(22);
						store(22)<=store(21);
						store(21)<=store(20);
						store(20)<=store(19);
						store(19)<=store(18);
						store(18)<=store(17);
						store(17)<=store(16);
						store(16)<=store(15);
						store(15)<=store(14);
						store(14)<=store(13);
						store(13)<=store(12);
						store(12)<=store(11);
						store(11)<=store(10);
						store(10)<=store(9);
						store(9)<=store(8);
						store(8)<=store(7);
						store(7)<=store(6);
						store(6)<=store(5);
						store(5)<=store(4);
						store(4)<=store(3);
						store(3)<=store(2);
						store(2)<=store(1);
						store(1)<=store(0);
						store(0)<='0';
				elsif( Q(i)='1' ) then 
					if ( flag='0' ) then 
						R<=M(31 downto 0); 
						sum<= M(31 downto 0);
						store(31)<=M(30);
						store(30)<=M(29);
						store(29)<=M(28);
						store(28)<=M(27);
						store(27)<=M(26);
						store(26)<=M(25);
						store(25)<=M(24);
						store(24)<=M(23);
						store(23)<=M(22);
						store(22)<=M(21);
						store(21)<=M(20);
						store(20)<=M(19);
						store(19)<=M(18);
						store(18)<=M(17);
						store(17)<=M(16);
						store(16)<=M(15);
						store(15)<=M(14);
						store(14)<=M(13);
						store(13)<=M(12);
						store(12)<=M(11);
						store(11)<=M(10);
						store(10)<=M(9);
						store(9)<=M(8);
						store(8)<=M(7);
						store(7)<=M(6);
						store(6)<=M(5);
						store(5)<=M(4);
						store(4)<=M(3);
						store(3)<=M(2);
						store(2)<=M(1);
						store(1)<=M(0);
						store(0)<='0';
						flag<='1';
						
					elsif (flag='1') then 
						R<=sum( 31 downto 0) + store(31 downto 0 );
						sum<=sum( 31 downto 0) + store( 31 downto 0);
						store(31)<=store(30);
						store(30)<=store(29);
						store(29)<=store(28);
						store(28)<=store(27);
						store(27)<=store(26);
						store(26)<=store(25);
						store(25)<=store(24);
						store(24)<=store(23);
						store(23)<=store(22);
						store(22)<=store(21);
						store(21)<=store(20);
						store(20)<=store(19);
						store(19)<=store(18);
						store(18)<=store(17);
						store(17)<=store(16);
						store(16)<=store(15);
						store(15)<=store(14);
						store(14)<=store(13);
						store(13)<=store(12);
						store(12)<=store(11);
						store(11)<=store(10);
						store(10)<=store(9);
						store(9)<=store(8);
						store(8)<=store(7);
						store(7)<=store(6);
						store(6)<=store(5);
						store(5)<=store(4);
						store(4)<=store(3);
						store(3)<=store(2);
						store(2)<=store(1);
						store(1)<=store(0);
						store(0)<='0';
					end if;
					i<=i+1;
				end if;
		end if;
		end if;
		if (enable='0' ) then 
		 R<="00000000000000000000000000000000";
		 end if;
		end process;


end Behavioral;

