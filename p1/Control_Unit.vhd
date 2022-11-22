----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:15 10/18/2022 
-- Design Name: 
-- Module Name:    Control_Unit - Behavioral 
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




-- if load word or store word then ALU op <= Add instruction .

entity Control_Unit is
	Port ( 
				op_code : in std_logic_vector ( 5 downto 0 ) ;
				clock : in std_logic ; 
				ALU_Src : out std_logic;
				Mem_write :out std_logic;
				Reg_write :out std_logic;
				Reg_dst :out std_logic;
				ALU_op : out std_logic_vector( 1 downto 0 ) ;
				Mem_to_reg : out std_logic;
				Mem_read : out std_logic;
				Branch : out std_logic
				);
end Control_Unit;

architecture Behavioral of Control_Unit is

begin
	process(clock,op_code)
		begin 
			if(rising_edge(clock)) then 
				case Op_code is
					when "000000" =>
					-- depends on function code 
						ALU_op<="10";
						Reg_dst<='1';
						ALU_Src<='0';
						Reg_write<='1';
						Mem_write<='0';
						Mem_read<='0';
						Mem_to_reg<='0';
					when "100011" =>
					-- load word
						Reg_dst <='0';
						ALU_Src <='1';
						Mem_to_reg <='1';
						Reg_write <='1';
						Mem_read<='1';
						Mem_write <= '0';
						Branch <= '0';
						ALU_op <= "00";
					
					when "101011" =>
					-- store word 
						
						ALU_Src <='1';
						
						Reg_write <='0';
						Mem_read<='0';
						Mem_write <= '1';
						Branch <= '0';
						ALU_op <= "00";
					-------------------------------------
					----- I type instructions ------------------
					when "001001" =>
					-- add imm
						Reg_dst <= '0';
						ALU_Src <= '1';
						Mem_to_reg <= '0';
						Reg_write <= '1';
						Mem_read <= '0';
						Mem_write <= '0';
						Branch <='0';
						ALU_op <= "00";
					
					when "001010" =>
					--set less than imm
					
					when "001011" =>
					--set less than imm unsigned
					
					when "001100" =>
					-- AND imm
					
					when "001101" =>
					-- OR imm 
					
					when "001110" =>
					--XOR immediate
					
					-------------------------------------------
					----- jump instrucions --------------------
					
					when others =>
					
				
				end case;
		
		
		
			end if;
		end process;


end Behavioral;

