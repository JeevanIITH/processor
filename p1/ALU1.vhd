----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:29:47 07/04/2022 
-- Design Name: 
-- Module Name:    ALU1 - Behavioral 
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

entity ALU1 is
    Port ( s: in std_logic_vector( 3 downto 0) ;
			  clock : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           r : out  STD_LOGIC_VECTOR (3 downto 0);
           sr : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end ALU1;

architecture Behavioral of ALU1 is
	
	--Adder module
	component four_bit_adder is 
		Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
	end component;
	
	--Multiplier
	component mul_2 is 
	port (    q:in std_logic_vector(3 downto 0);
				 m:in std_logic_vector(3 downto 0);
				 clk:in std_logic;
				 str:in std_logic;
				 product1:out std_logic_vector(3 downto 0);
				 product2:out std_logic_vector(3 downto 0) );
	
	end component;
	
	
	--Diviser
	component div1 is 
		port (			clock:in std_logic;
						d: in std_logic_vector(3 downto 0);
						m:in std_logic_vector(3 downto 0);
						q:out std_logic_vector(3 downto 0);
						enable: in std_logic
					);
	
	end component;
	
	--bitwise And
	component and_bit is 
	
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           R : out  STD_LOGIC_VECTOR (3 downto 0));
	
	end component;
	
	--bitwiseOr 
	component or_bit is 
	
		Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           r : out  STD_LOGIC_VECTOR (3 downto 0));
	
	end component;
	
	--bitwiseXOr 
	component xor_bit is 
	
		Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           r : out  STD_LOGIC_VECTOR (3 downto 0));
	
	end component;
	
	--signal declaration for alu module
	signal r_alu,sp_alu: std_logic_vector( 3 downto 0);
	signal cout_alu:std_logic;
	
	
	--signal for Adder 
	signal a_adder,b_adder,r_adder:std_logic_vector (3 downto 0);
	signal cin_adder:std_logic;
	
	--signal for multiplier
	signal clk_mult,str_mult :std_logic;
	signal a_mult,b_mult:std_logic_vector( 3 downto 0) ;
	signal r_mult,sr_mult:std_logic_vector ( 3 downto 0 ) ;
	
	--signal for diviser
	signal clk_div, enable_div:std_logic;
	signal a_div,b_div,r_div:std_logic_vector( 3 downto 0) ;
	
	--signal for bitwise op
	signal a_and_bit,b_and_bit,r_and_bit :std_logic_vector (3 downto 0);
	signal a_or_bit,b_or_bit , r_or_bit :std_logic_vector (3 downto 0);
	signal a_xor_bit,b_xor_bit , r_xor_bit :std_logic_vector (3 downto 0);

	
	

begin

	Adder:four_bit_adder port map ( a_adder, b_adder , cin_adder , r_adder , cout );
	Multiplier:mul_2 port map ( a_mult, b_mult , clock , str_mult , sr_mult , r_mult  );
	Diviser : div1 port map( clock , b_div , a_div , r_div , enable_div );
	BitwiseAnd: and_bit port map ( a_and_bit , b_and_bit , r_and_bit );
	BitwiseOr : or_bit port map ( a_or_bit , b_or_bit , r_or_bit );
	BitwiseXor : xor_bit port map ( a_xor_bit , b_xor_bit , r_xor_bit );
	

	process(  s ,A ,B ,cin , r_and_bit , r_or_bit , r_xor_bit , r_adder , r_mult ,sr_mult , r_div) 
	begin 
	
		case s is 
			--AND module
			when "0000" => a_and_bit <=A ; b_and_bit <= B; r<=r_and_bit;
			
			--OR module 
			when "0001" => a_or_bit <=A  ; b_or_bit <=B ; r<= r_or_bit;
			
			--XOR module 
			when "0010" => a_xor_bit<=A  ; b_xor_bit <= B ; r<=r_xor_bit;
			
			--ADDER module
			when "0010" => a_adder <=A  ; b_adder <=B ; cin_adder <=cin   ; r<=r_adder ; 
			
			--MULTIPLIER module
			when "0100" => a_mult <=A ; b_mult <= B ; str_mult <='1'   ; r<=r_mult; sr<=sr_mult;
			
			--DIVISER module
			when "0101" => enable_div<='1' ; a_div<=A ; b_div<=B  ; r<=r_div;
			
			when others => r<="0000";
			
		end case;
		 
	
	end process;
	
	
	



end Behavioral;

