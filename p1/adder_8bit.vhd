----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:34:37 10/29/2022 
-- Design Name: 
-- Module Name:    adder_8bit - Behavioral 
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

entity adder_8bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end adder_8bit;

architecture Behavioral of adder_8bit is
		component four_bit_adder is 
		Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
			  cin: in std_logic;
			  cout:out std_logic );
		end component;
		signal carry: std_logic;
begin
		adder1 : four_bit_adder port map(a(3 downto 0) , b(3 downto 0) ,sum(3 downto 0), cin , carry ) ;
		adder2 :four_bit_adder port map( a(7 downto 4) , b(7 downto 4) , sum(7 downto 4) , carry , cout );
		
end Behavioral;

