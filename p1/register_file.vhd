----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:05:47 10/04/2022 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
    Port ( reg_a : out  STD_LOGIC_VECTOR (31 downto 0);
           reg_b : out  STD_LOGIC_VECTOR (31 downto 0);
           reg_w : in  STD_LOGIC_VECTOR (31 downto 0);
           enable_write : in  STD_LOGIC;
           sel_reg_a : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_reg_b : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_reg_w : in  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end register_file;

architecture Behavioral of register_file is 
	type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);
   signal registers : registerFile;
	signal t1 : std_logic_vector ( 4 downto 0 ) := "00000";
	signal t2 : std_logic_vector ( 4 downto 0 ) := "00001";

begin
	
	regFile : process (clk , enable_write , sel_reg_a , sel_reg_b , sel_reg_w) is
	begin
		registers(0)<="00000000000000000000000000001110";
		registers(1)<="00000000000000000000000000000111";
    if rising_edge(clk) then
		--registers(to_integer(unsigned(t1))) <= "00000000000000000000000000000110";
	   --registers(to_integer(unsigned(t2))) <= "00000000000000000000000000000110";
      -- Read A and B before bypass
      reg_a <= registers(to_integer(unsigned(sel_reg_a)));
      reg_b <= registers(to_integer(unsigned(sel_reg_b)));
      -- Write and bypass
      if enable_write = '1' then
			if reset='0' then
				registers(to_integer(unsigned(sel_reg_w))) <= reg_w;  -- Write
			else 
				registers(to_integer(unsigned(sel_reg_w))) <= "00000000000000000000000000000000";  
			end if;
		  
--        if regASel = writeRegSel then  -- Bypass for read A
--          outA <= input;
--        end if;
--        if regBSel = writeRegSel then  -- Bypass for read B
--          outB <= input;
--        end if;
		  
      end if;
    end if;
	end process;


end Behavioral;

