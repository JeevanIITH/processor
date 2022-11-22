----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:06 10/29/2022 
-- Design Name: 
-- Module Name:    adder_32 - Behavioral 
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

entity adder_32 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
			  invert : in std_logic;
           cin : in  STD_LOGIC;
			  enable : in std_logic;
           sum : out  STD_LOGIC_VECTOR (31 downto 0);
           cout : out  STD_LOGIC);
end adder_32;

architecture Behavioral of adder_32 is
		component adder_16 is 
		 Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
				  b : in  STD_LOGIC_VECTOR (15 downto 0);
				  cin : in  STD_LOGIC;
				  sum : out  STD_LOGIC_VECTOR (15 downto 0);
				  cout : out  STD_LOGIC);
		end component;
		
		component two_complement is 
			    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
							invert : in std_logic ;
							output : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;
		
		component add_enable is 
			Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           enable : in  STD_LOGIC;
           as : out  STD_LOGIC_VECTOR (31 downto 0);
           bs : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;
		signal carry : std_logic;
		signal B_invert : std_logic_vector ( 31 downto 0);
		signal as, bs : std_logic_vector (31 downto 0 );
		
begin
		
		enable_comp : add_enable port map(a,b,enable,as, bs);
		sign_invert : two_complement port map(bs ,invert ,B_invert ) ;
		adder1:adder_16 port map(as(15 downto 0) , B_invert(15 downto 0) , cin , sum(15 downto 0) , carry ) ;
		adder2 : adder_16 port map(as(31 downto 16) , B_invert(31 downto 16) ,carry , sum(31 downto 16) , cout ); 

end Behavioral;

