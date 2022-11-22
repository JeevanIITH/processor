----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:34 05/30/2022 
-- Design Name: 
-- Module Name:    Two_bit_adder - st1 
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

entity Two_bit_adder is
    Port ( a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s0 : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end Two_bit_adder;

architecture st1 of Two_bit_adder is
component one_bit_adder 
Port(a :in std_logic ; b:in std_logic; cin:in std_logic ; sum:out std_logic; cout:out std_logic);
end component;
signal c_temp1:std_logic;
begin
f1:one_bit_adder port map(a0,b0,cin,s0,c_temp1);
f2:one_bit_adder port map(a1,b1,c_temp1,s1,cout);
end st1;

