----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:20:26 10/28/2022 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( s: in std_logic_vector( 3 downto 0) ;   -- select 
			  clock : in  STD_LOGIC;						-- clock 
           A : in  STD_LOGIC_VECTOR (31 downto 0);  -- input A 
           B : in  STD_LOGIC_VECTOR (31 downto 0);	-- input B
           cin : in  STD_LOGIC;							-- Cin
           r : out  STD_LOGIC_VECTOR (31 downto 0);  -- result 1
           sr : out  STD_LOGIC_VECTOR (31 downto 0); --second result 2
			  
           cout : out  STD_LOGIC);                 -- cout
end alu;

architecture Behavioral of alu is
	
	--Adder module
	component adder_32 is 
		Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
			  invert : in std_logic;
           cin : in  STD_LOGIC;
			  enable : in std_logic;
           sum : out  STD_LOGIC_VECTOR (31 downto 0);
           cout : out  STD_LOGIC);
	end component;
	
	--Multiplier
	component MUlT is 
    Port ( M : in  STD_LOGIC_VECTOR (31 downto 0);
           Q : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  enable : in std_logic;
           R : out  STD_LOGIC_VECTOR (31 downto 0));
	
	end component;
	
	
	--Diviser
	component div1 is 
		port (			clock:in std_logic;
						d: in std_logic_vector(31 downto 0);
						m:in std_logic_vector(31 downto 0);
						q:out std_logic_vector(31 downto 0);
						r:out std_logic_vector(31 downto 0);
						enable: in std_logic
					);
	
	end component;
	
	component demux is
		Port ( sel : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
	end component ;
	
	--bitwise And
	component and_bit is 
	
		Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           R : out  STD_LOGIC_VECTOR (31 downto 0));
	
	end component;
	
	--bitwiseOr 
	component or_bit is 
	
		Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           r : out  STD_LOGIC_VECTOR (31 downto 0));
	
	end component;
	
	--bitwiseXOr 
	component xor_bit is 
	
		Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           r : out  STD_LOGIC_VECTOR (31 downto 0));
	
	end component;
	
	component enable_demux_bus is 
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
	end component ;
	
	
	--signal declaration for alu module
	signal r_alu,sp_alu: std_logic_vector( 31 downto 0);
	signal cout_alu:std_logic;
	
	
	--signal for Adder 
	signal a_adder,b_adder,r_adder:std_logic_vector (31 downto 0);
	signal cin_adder:std_logic;
	
	--signal for multiplier
	signal clk_mult,str_mult :std_logic;
	signal a_mult,b_mult:std_logic_vector( 31 downto 0) ;
	signal r_mult,sr_mult:std_logic_vector ( 31 downto 0 ) ;
	
	--signal for diviser
	signal clk_div:std_logic;
	signal a_div,b_div,q_div,r_div:std_logic_vector( 31 downto 0) ;
	
	--signal for bitwise op
	signal a_and_bit,b_and_bit,r_and_bit :std_logic_vector (31 downto 0);
	signal a_or_bit,b_or_bit , r_or_bit :std_logic_vector (31 downto 0);
	signal a_xor_bit,b_xor_bit , r_xor_bit :std_logic_vector (31 downto 0);
	
	signal c : std_logic_vector(31 downto 0):="00000000000000000000000000000001";

	
	signal invert : std_logic ;
	
	signal enable_add , enable_mul , enable_div ,enable_extra:  std_logic ;
	signal enable1, enable2 , enable3 , enable4 : std_logic;
	signal enable5, enable6 , enable7 , enable8 : std_logic;
	signal enable9, enable10 , enable11 , enable12 : std_logic;
	signal enable_bus : std_logic_vector(15 downto 0 ) ;
	

begin

	Adder:adder_32 port map ( A, B ,invert , cin_adder ,enable_add, r_adder , cout );
	Multiplier:MUlT port map ( A, B , clock , str_mult , enable_mul , r_mult  );
	Diviser : div1 port map( clock , B , A , q_div ,r_div, enable_div );
	BitwiseAnd: and_bit port map ( A , B , r_and_bit );
	BitwiseOr : or_bit port map ( A , B , r_or_bit );
	BitwiseXor : xor_bit port map ( A, B , r_xor_bit );
	
	enable_bus_module : enable_demux_bus port map(enable_bus,enable1,enable2 , enable3 ,enable_add , enable_mul , enable_div , enable4 , enable5 , enable6 , enable7 , enable8 , enable9 , enable10 , enable11 , enable12 , enable_extra);
	--enable_bus <= enable1 & enable2 & enable3 &enable_add & enable_mul & enable_div & enable4 & enable5 & enable6 & enable7 & enable8 & enable9 & enable10 & enable11 & enable12 & enable_extra;
	alu_select : demux port map(s,enable_bus);

	process(  s ,A ,B ,cin , r_and_bit , r_or_bit , r_xor_bit , r_adder , r_mult ,sr_mult ,q_div, r_div) 
	begin 
	
		case s is 
			--AND module
			when "0000" =>  r<=r_and_bit; sr<="00000000000000000000000000000000";
			
			--OR module 
			when "0001" =>  r<= r_or_bit;  sr<="00000000000000000000000000000000";
			
			--XOR module 
			when "1110" =>  r<=r_xor_bit;   sr<="00000000000000000000000000000000";
			
			--ADDER module
			when "0010" => invert <='0'; cin_adder <='0'   ; r<=r_adder ; sr<="00000000000000000000000000000000";
			-- Subtract
			when "0110" => invert <='1'; cin_adder <='0'   ; r<=r_adder ; sr<="00000000000000000000000000000000";
			
			--MULTIPLIER module
			when "0011" => str_mult <='0'   ; r<=r_mult; sr<="00000000000000000000000000000000";
			
			--DIVISER module
			when "0111" =>    r<=q_div; sr<=r_div ;
			       
			
			when others => r<="00000000000000000000000000000000"; sr<="00000000000000000000000000000000";
			
		end case;
		 
	
	end process;
	
	
	



end Behavioral;
