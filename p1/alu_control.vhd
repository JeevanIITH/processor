----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:07 10/28/2022 
-- Design Name: 
-- Module Name:    alu_control - Behavioral 
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

entity alu_control is
    Port ( ALU_op : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_control_input : out  STD_LOGIC_VECTOR (3 downto 0));
end alu_control;

architecture Behavioral of alu_control is

begin
    process(ALU_op , funct)
	 begin 
        if ALU_op="01" then
            alu_control_input <= "0110";
        end if ;

        if ALU_op ="00" then
            alu_control_input <= "0010";
        end if ;

        if (ALU_op = "10") then 
            case( funct ) is
            
                when "100000" =>
                    -- add signal
                    alu_control_input <="0010";
                when "100010" =>
                    --subtract
                    alu_control_input <="0110";
                when "100100" =>
                    --AND
                    alu_control_input <="0000";
                when "100101" =>
                    --OR
                    alu_control_input <="0001";
                when "101010" =>
                    --set on less than
                    alu_control_input <="0111";

                ---------------------------    
                when "111111" =>
                --multiplier
                    alu_control_input <="1111";
                when "111110" =>
                -- xor
                    alu_control_input <= "1110";
                when others => 
                --others 
                alu_control_input <="1101";
                
            
            end case ;
        end if;
        
    end process;


end Behavioral;

