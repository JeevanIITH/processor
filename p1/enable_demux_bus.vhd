----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:04 11/13/2022 
-- Design Name: 
-- Module Name:    enable_demux_bus - Behavioral 
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

entity enable_demux_bus is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
			  e0 : out std_logic;
           e1 : out  STD_LOGIC;
           e2 : out  STD_LOGIC;
           e3 : out  STD_LOGIC;
           e4 : out  STD_LOGIC;
           e5 : out  STD_LOGIC;
           e6 : out  STD_LOGIC;
           e7 : out  STD_LOGIC;
           e8 : out  STD_LOGIC;
           e9 : out  STD_LOGIC;
           e10 : out  STD_LOGIC;
           e11 : out  STD_LOGIC;
           e12 : out  STD_LOGIC;
           e13 : out  STD_LOGIC;
           e14 : out  STD_LOGIC;
           e15 : out  STD_LOGIC);
end enable_demux_bus;

architecture Behavioral of enable_demux_bus is

begin

	e0<=a(0);
	e1<=a(1);
	e2<=a(2);
	e3<=a(3);
	e4<=a(4);
	e5<=a(5);
	e6<=a(6);
	e7<=a(7);
	e8<=a(8);
	e9<=a(9);
	e10<=a(10);
	e11<=a(11);
	e12<=a(12);
	e13<=a(13);
	e14<=a(14);
	e15<=a(15);
		


end Behavioral;

