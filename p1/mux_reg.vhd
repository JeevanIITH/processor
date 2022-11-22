----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:02 10/31/2022 
-- Design Name: 
-- Module Name:    mux_reg - Behavioral 
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

entity mux_reg is
    Port ( sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           sel3 : in  STD_LOGIC_VECTOR (4 downto 0);
           reg_dst : in  STD_LOGIC;
           write_reg : out  STD_LOGIC_VECTOR (4 downto 0));
end mux_reg;

architecture Behavioral of mux_reg is

begin
    process(reg_dst,sel2,sel3)
    begin 
        if reg_dst='1' then 
            write_reg <= sel3;
        else
            write_reg <= sel2;
        end if;
    end process;



end Behavioral;

