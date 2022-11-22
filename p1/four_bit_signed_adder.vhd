----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:41:04 08/12/2022 
-- Design Name: 
-- Module Name:    four_bit_signed_adder - Behavioral 
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

entity four_bit_signed_adder is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
			  cin: in std_logic;
			  cout:out std_logic);
end four_bit_adder;

architecture Behavioral of four_bit_signed_adder is

component Two_bit_adder  
Port ( a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s0 : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           cout : out  STD_LOGIC );
end component;

signal carry:std_logic;
signal sum_3:std_logic;
begin



f1:Two_bit_adder port map(a(0),a(1),b(0),b(1),cin,sum(0),sum(1),carry );
f2:Two_bit_adder port map(a(2),a(3),b(2),b(3),carry,sum(2),sum_3,cout );

sum(3)<=sum_3;

--process( sum_3 )
--	begin
--	if ( a(3)=b(3) and b(3)='0' and sum_3='1') then
--		ovflw<='1';
--	elsif ( a(3) =b(3) and b(3)='1' and sum_3 = '0' ) then 
--		ovflw<='1';
--	else
--		ovflw<='0';
--	end if ;
--	
--	
--	
--	
--	end process;
end Behavioral;

