----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:32:00 11/14/2022 
-- Design Name: 
-- Module Name:    shift_left_2 - Behavioral 
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

entity shift_left_2 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end shift_left_2;

architecture Behavioral of shift_left_2 is

begin
    
	output(31)<=a(29);
    output(30)<=a(28);
    output(29)<=a(27);
    output(28)<=a(26);
    output(27)<=a(25);
    output(26)<=a(24);
    output(25)<=a(23);
    output(24)<=a(22);
    output(23)<=a(21);
    output(22)<=a(20);
    output(21)<=a(19);
    output(20)<=a(18);
    output(19)<=a(17);
    output(18)<=a(16);
    output(17)<=a(15);
    output(16)<=a(14);
    output(15)<=a(13);
    output(14)<=a(12);
    output(13)<=a(11);
    output(12)<=a(10);
    output(11)<=a(9);
    output(10)<=a(8);
    output(9)<=a(7);
    output(8)<=a(6);
    output(7)<=a(5);
    output(6)<=a(4);
    output(5)<=a(3);
    output(4)<=a(2);
    output(3)<=a(1);
    output(2)<=a(0);
    output(1)<='0';
    output(0)<='0';


end Behavioral;

