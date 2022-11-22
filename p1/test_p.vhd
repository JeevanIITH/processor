--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:26:40 10/31/2022
-- Design Name:   
-- Module Name:   D:/vhdl_github_2/vhdl_github_2/p1/test_p.vhd
-- Project Name:  p1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: processor
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_p IS
END test_p;
 
ARCHITECTURE behavior OF test_p IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processor
    PORT(
         clock : IN  std_logic;
         sel_1 : IN  std_logic_vector(4 downto 0);
         sel_2 : IN  std_logic_vector(4 downto 0);
         sel_3 : IN  std_logic_vector(4 downto 0);
         f_code : IN  std_logic_vector(5 downto 0);
         op_code : IN  std_logic_vector(5 downto 0);
         immediate : IN  std_logic_vector(31 downto 0);
         alu_in_m : IN  std_logic;
         reg_reset : IN  std_logic;
         alu_out_m : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal sel_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal sel_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal sel_3 : std_logic_vector(4 downto 0) := (others => '0');
   signal f_code : std_logic_vector(5 downto 0) := (others => '0');
   signal op_code : std_logic_vector(5 downto 0) := (others => '0');
   signal immediate : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_in_m : std_logic := '0';
   signal reg_reset : std_logic := '0';

 	--Outputs
   signal alu_out_m : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor PORT MAP (
          clock => clock,
          sel_1 => sel_1,
          sel_2 => sel_2,
          sel_3 => sel_3,
          f_code => f_code,
          op_code => op_code,
          immediate => immediate,
          alu_in_m => alu_in_m,
          reg_reset => reg_reset,
          alu_out_m => alu_out_m
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		op_code <= "000000";
		sel_1 <="00000";
		sel_2 <="00001";
		sel_3 <="00010";
		f_code <="100000";
		alu_in_m <='0';
		reg_reset <='0';
		immediate <="00000000000000000000000000000110";

      wait for clock_period*2;
		op_code <= "000000";
		sel_1 <="00010";
		sel_2 <="00001";
		sel_3 <="00011";
		f_code <="100010";
		alu_in_m <='0';
		reg_reset <='0';
		immediate <="00000000000000000000000000000110";
		wait for clock_period*10;
      -- insert stimulus here 
		assert false report "ok" severity failure ;

      -- insert stimulus here 

      wait;
   end process;

END;
