--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:10:32 10/27/2016
-- Design Name:   
-- Module Name:   D:/Dropbox/Pierkey/Academia/Arquitectura/ProcesadorMonociclo2016/ProcesadorMonociclo/TB_ProcesadorMonociclo2.vhd
-- Project Name:  ProcesadorMonociclo2016
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ProcesadorMonociclo2
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
 
ENTITY TB_ProcesadorMonociclo2 IS
END TB_ProcesadorMonociclo2;
 
ARCHITECTURE behavior OF TB_ProcesadorMonociclo2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcesadorMonociclo2
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         in_Procesador : IN  std_logic_vector(31 downto 0);
         out_Procesador : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
   signal in_Procesador : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal out_Procesador : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcesadorMonociclo2 PORT MAP (
          clk => clk,
          rst => rst,
          in_Procesador => in_Procesador,
          out_Procesador => out_Procesador
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '0';
		in_Procesador <= x"00000001";
		
      -- insert stimulus here 

      wait;
   end process;

END;
