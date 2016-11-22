----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    nPC - Behavioral 
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

entity nPC is
 Port ( in_nPC : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           out_nPC : out  STD_LOGIC_VECTOR (31 downto 0));
end nPC;

architecture Behavioral of nPC is

begin
process(clk,in_nPC,rst)
begin
		if(rst = '0') then
		   if(rising_edge(clk)) then
		   out_nPC <= in_nPC;
			end if;
		  elsif(rst = '1') then
			out_nPC <= X"00000000";
		  end if;
end process;

end Behavioral;



