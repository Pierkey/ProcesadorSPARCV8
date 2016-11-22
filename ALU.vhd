----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           inMUX : in  STD_LOGIC_VECTOR (31 downto 0);
           --c : in  STD_LOGIC;
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           outALU : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process(crs1,inMUX,ALUOP)
	begin
		case ALUOP is
			when "000000" => --add
				outALU <= crs1 + inMUX;
			when "000100" => --sub
				outALU <= crs1 - inMUX;
			when "000001" => --and
				outALU <= crs1 and inMUX;
			when "000101" => --andN
				outALU <= not(crs1 and inMUX);
			when "000010" => --or
				outALU <= crs1 or inMUX;
			when "000110" => --orN
				outALU <= not(crs1 or inMUX);
			when "000011" => --xor
				outALU <= crs1 xor inMUX;
			when "000111" => --xnor
				outALU <= not(crs1 xor inMUX);
			when others =>
				outALU <= x"00000000"; --CUALQUIER OTRO CASO
		end case;
	end process;

end Behavioral;

