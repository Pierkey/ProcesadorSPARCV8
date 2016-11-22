----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    AluMux - Behavioral 
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

entity AluMux is
Port (     CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           SEU : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end AluMux;

architecture Behavioral of AluMux is
begin
process(CRS2,SEU,i)
	begin
		if(i='1')then
			salida <= SEU;
		else
			if(i='0')then
				salida <= CRS2;
			end if;
		end if;
	
	end process;
end Behavioral;

