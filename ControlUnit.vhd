----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
Port (     op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0);
           wrEnRF : out  STD_LOGIC);
end ControlUnit;

architecture Behavioral of ControlUnit is


begin
process (op, op3)
begin
  if(op = "10")then
	case(op3) is
		when "000000" => --ADD
			ALUOP <= "000000";
			wrEnRF <= '1';
		when "000100" => --SUB
			ALUOP <= "000100";
			wrEnRF <= '1';
		when "000001" => --AND
			ALUOP <= "000001" ;
			wrEnRF <= '1';
		when "000101" => --ANDn
			ALUOP <= "000101" ;
			wrEnRF <= '1';
		when "000010" => --OR
			ALUOP <= "000010";
			wrEnRF <= '1';
		when "000110" => --ORn
			ALUOP <= "000110" ;
			wrEnRF <= '1';
		when "000011" => --XOR
			ALUOP <= "000011" ;
			wrEnRF <= '1';
		when "000111" => --XNOR
			ALUOP <= "000111" ;
			wrEnRF <= '1';
		when others => 
			ALUOP <= "000000";
			wrEnRF <= '1';
	end case;
  else
	ALUOP <= "000000";
	wrEnRF <= '0';
  end if;
end process;

end Behavioral;

