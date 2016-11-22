----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name:    RF - Behavioral 
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

entity RF is
 Port (    rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           rst : in  STD_LOGIC;
           wen : in  STD_LOGIC;
           dataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crd : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is
type RFmemory is array (0 to 39) of std_logic_vector (31 downto 0);
signal rf_signal:RFmemory:= (others => x"00000000");
begin
	process(rs1,rs2,rd,rst,wen,dataToWrite)
		begin
			if(rst = '0') then
				crs1 <= rf_signal(conv_integer(rs1));
				crs2 <= rf_signal(conv_integer(rs2));
				crd <= rf_signal(conv_integer(rd));
				if(wen = '1' and rd /= "000000") then
					rf_signal(conv_integer(rd)) <= dataToWrite;
				end if;
			else
				crs1 <= (others => '0');
				crs2 <= (others => '0');
				crd <= (others => '0');
			end if;
	end process;
end Behavioral;

