----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:15 10/29/2022 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
			port (
						clock : in std_logic;
						zero_signal_s : out std_logic;
						alu_in_m : in std_logic;
						reg_reset : in std_logic ;
						top : out std_logic;
						alu_immediate_signal : out std_logic_vector(31 downto 0);
						alu_out_m : out std_logic
			
			);
end processor;

architecture Behavioral of processor is

	component alu is 
	
		    Port ( s: in std_logic_vector( 3 downto 0) ;   -- select 
			  clock : in  STD_LOGIC;						-- clock 
           A : in  STD_LOGIC_VECTOR (31 downto 0);  -- input A 
           B : in  STD_LOGIC_VECTOR (31 downto 0);	-- input B
           cin : in  STD_LOGIC;							-- Cin
           r : out  STD_LOGIC_VECTOR (31 downto 0);  -- result 1
           sr : out  STD_LOGIC_VECTOR (31 downto 0); --second result 2
			  
           cout : out  STD_LOGIC);                 -- cout

	end component;
	
	
	component Control_unit is 
		Port ( 
				op_code : in std_logic_vector( 5 downto 0 ) ;
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
	
	end component ;
		
	
	component register_file is 
    Port ( reg_a : out  STD_LOGIC_VECTOR (31 downto 0);
           reg_b : out  STD_LOGIC_VECTOR (31 downto 0);
           reg_w : in  STD_LOGIC_VECTOR (31 downto 0);
           enable_write : in  STD_LOGIC;
           sel_reg_a : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_reg_b : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_reg_w : in  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
	end component ;
	
	component alu_control is 
		Port ( ALU_op : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_control_input : out  STD_LOGIC_VECTOR (3 downto 0));
	end component ;



	component memory is 
			Port ( clock : in std_logic;
				address : in  STD_LOGIC_VECTOR (31 downto 0);
				mem_write : in  STD_LOGIC;
				write_data : in  STD_LOGIC_VECTOR (31 downto 0);
				mem_read : in  STD_LOGIC;
				read_data : out  STD_LOGIC_VECTOR (31 downto 0));
	end component ;
	
	component mux_mem is 
			Port ( mem : in  STD_LOGIC_VECTOR (31 downto 0);
				alu : in  STD_LOGIC_VECTOR (31 downto 0);
				mem_to_reg : in  STD_LOGIC;
				to_reg : out  STD_LOGIC_VECTOR (31 downto 0));
	end component ;

	component mux_alu is 
			Port ( read_data_2 : in  STD_LOGIC_VECTOR (31 downto 0);
				immediate : in  STD_LOGIC_VECTOR (31 downto 0);
				alu_src : in  STD_LOGIC;
				alu_input_2 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;

	component mux_reg is 
			Port ( sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
				sel3 : in  STD_LOGIC_VECTOR (4 downto 0);
				reg_dst : in  STD_LOGIC;
				write_reg : out  STD_LOGIC_VECTOR (4 downto 0));
	end component ;

	component instruction_block is 
		Port ( pc : in  STD_LOGIC_VECTOR (31 downto 0);
		instruction : out  STD_LOGIC_VECTOR (31 downto 0));
	end component ;
	component sign_extend is 
		    Port ( a_bit : in  STD_LOGIC_VECTOR (15 downto 0);
           b_bit : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;

	component add_branch is
		Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
			   b : in  STD_LOGIC_VECTOR (31 downto 0);
			   output : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;

	component add_pc is
		Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
			   output : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;

	component shift_left_2 is
		Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
			   output : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component branch_and is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           o : out  STD_LOGIC);
	end component;
	
	component pc_mux is
    Port ( pc_4 : in  STD_LOGIC_VECTOR (31 downto 0);
           immediate : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
		   top : out std_logic;
           output1 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component pc_main is 
		    Port ( pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
				clock : in std_logic ;
				go_next : in std_logic ;
				update : in std_logic ;
				pc_write : in std_logic ;
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
	end component ;
	
	component zero_m is 
		    Port ( r : in  STD_LOGIC_VECTOR (31 downto 0);
			clock : in std_logic;
			top: out std_logic;
           zero : out  STD_LOGIC);
	end component;

	-------------instr------------
	--signal instr : std_logic_vector ( 15 downto 0 ) ;
	--signal pc_in : std_logic_vector ( 31 downto 0 ) ;
	signal pc_out_signal : std_logic_vector ( 31 downto 0 ) ;
	
	----------------Control_Unit----------------------------
	signal alu_op_s : std_logic_vector( 1 downto 0 ) ;
	signal op_code : std_logic_vector( 5 downto 0 ) ;
	signal reg_dst_s ,branch_s , mem_read_s , mem_to_reg_s ,mem_write_s ,alu_src_s , reg_write_s:std_logic;
	--------------------------------------------------------
	
	
	---------------Reg file ----------------------------
	signal sel_reg_a , sel_reg_b , sel_reg_w : STD_LOGIC_VECTOR (4 downto 0);
	signal reg_a , reg_b ,read_data_2 : std_logic_vector ( 31 downto  0 );
	signal reg_w_s : std_logic_vector ( 31 downto 0 ) ;
	--signal reg_reset : std_logic := '0';
	
	----------------------------------------------------
	
	


	-----------------------ALU----------------------------------
	signal alu_result_1 : std_logic_vector ( 31 downto 0) ;
	signal alu_result_2 : std_logic_vector ( 31 downto 0);
	signal alu_in_1 :std_logic_vector ( 31 downto 0);
	signal alu_in_2 :std_logic_vector ( 31 downto 0);
	signal alu_control_line_s : std_logic_vector ( 3 downto 0);
	signal alu_cin,alu_cout : std_logic;
	---------------------------------------------------------------
	
	------------------ALU control -----------------
	signal funct : std_logic_vector ( 5 downto 0) ;
	--------------------------------------------------

	signal read_data : std_logic_vector (31 downto 0);

	signal immediate : std_logic_vector (15 downto 0 );
	signal immediate_extend : std_logic_vector ( 31 downto 0 ) ;
	signal sel_3 : std_logic_vector (4 downto 0);
	signal f_code : std_logic_vector ( 5 downto 0 );
	signal instr_full : std_logic_vector ( 31 downto 0 );
	signal pc_signal , pc_plus_4_signal , pc_final ,shift_left_2_signal , pc_add_immediate_signal : std_logic_vector(31 downto 0) ;
	signal branch_and_signal  , zero_signal: std_logic ;
	
	signal pc_go_next_signal , pc_update_signal , pc_write_signal : std_logic ;
begin
		pc_plus_four : add_pc port map(pc_signal ,pc_plus_4_signal );
		pc_plus_immediate : add_branch port map(pc_plus_4_signal ,shift_left_2_signal ,  pc_add_immediate_signal );
		shift_left_two : shift_left_2 port map(immediate_extend,shift_left_2_signal);
		zero_module : zero_m port map(alu_result_1,clock,zero_signal_s,zero_signal);
		branch_and_module : branch_and port map(branch_s , zero_signal , branch_and_signal );
		mux_pc : pc_mux port map(pc_plus_4_signal , pc_add_immediate_signal ,branch_and_signal ,top , alu_immediate_signal );
		
		pc_main_module : pc_main port map (pc_final , clock , pc_go_next_signal , pc_update_signal , pc_write_signal ,pc_signal );
			

		instructin_mem : instruction_block port map (pc_signal ,instr_full);

		op_code  <= instr_full(31 downto 26);
		sel_reg_a <= instr_full(25 downto 21);
		sel_reg_b <= instr_full(20 downto 16);
		
		sign_ext : sign_extend port map(instr_full(15 downto 0),immediate_extend);

		reg_mux : mux_reg port map ( sel_reg_b , instr_full(15 downto 11) ,reg_dst_s , sel_reg_w );
		registers : register_file port map(alu_in_1,read_data_2 , reg_w_s , reg_write_s ,sel_reg_a , sel_reg_b , sel_reg_w , clock,reg_reset );
		controller : Control_Unit port map(op_code,clock ,  alu_src_s , mem_write_s , reg_write_s , reg_dst_s , alu_op_s , mem_to_reg_s , mem_read_s , branch_s ) ;
		
		alu1 : alu port map(alu_control_line_s,clock,alu_in_1,alu_in_2,alu_in_m ,alu_result_1 ,alu_result_2  , alu_out_m);
		
		
		alu_control_unit : alu_control port map(alu_op_s , instr_full(5 downto 0) , alu_control_line_s);
		memory_unit : memory port map(clock , alu_result_1 ,mem_write_s , read_data_2 , mem_read_s , read_data  );
		memory_mux : mux_mem port map(read_data , alu_result_1 , mem_to_reg_s ,reg_w_s);
		alu_mux : mux_alu port map (read_data_2 , immediate_extend ,alu_src_s ,alu_in_2 );
		

		
end Behavioral;

