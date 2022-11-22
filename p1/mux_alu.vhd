----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:49:59 10/30/2022 
-- Design Name: 
-- Module Name:    mux_alu - Behavioral 
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

entity mux_alu is
    Port ( read_data_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           immediate : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_src : in  STD_LOGIC;
           alu_input_2 : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_alu;

architecture Behavioral of mux_alu is

begin
    process ( alu_src , read_data_2 , immediate)
    begin 
        if ( alu_src='0') then 
            alu_input_2 <= read_data_2;
        else
            alu_input_2 <= immediate ;
        end if;
    end process;


end Behavioral;

