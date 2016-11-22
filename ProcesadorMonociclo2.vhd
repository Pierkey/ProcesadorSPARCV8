----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:53:29 10/27/2016 
-- Design Name: 
-- Module Name:    ProcesadorMonociclo2 - Arq_Procesador2 
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

entity ProcesadorMonociclo2 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           in_Procesador : in  STD_LOGIC_VECTOR (31 downto 0);
           out_Procesador : out  STD_LOGIC_VECTOR (31 downto 0));
end ProcesadorMonociclo2;

architecture Arq_Procesador2 of ProcesadorMonociclo2 is


	COMPONENT Adder
	PORT(
		op1 : IN std_logic_vector(31 downto 0);
		op2 : IN std_logic_vector(31 downto 0);          
		resul : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT nPC
	PORT(
		in_nPC : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		out_nPC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PC
	PORT(
		in_PC : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		out_PC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT IM
	PORT(
		clk : IN std_logic;
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ControlUnit
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0);
		wrEnRF : OUT std_logic
		);
	END COMPONENT;

	COMPONENT ALU
	PORT(
		crs1 : IN std_logic_vector(31 downto 0);
		inMUX : IN std_logic_vector(31 downto 0);
		ALUOP : IN std_logic_vector(5 downto 0);          
		outALU : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT registerFile
	PORT(
		clkFPGA : IN std_logic;
		reset : IN std_logic;
		registerSource1 : IN std_logic_vector(4 downto 0);
		registerSource2 : IN std_logic_vector(4 downto 0);
		registerDestination : IN std_logic_vector(4 downto 0);
		writeEnable : IN std_logic;
		dataToWrite : IN std_logic_vector(31 downto 0);          
		contentRegisterSource1 : OUT std_logic_vector(31 downto 0);
		contentRegisterSource2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT SEU
	PORT(
		simm13 : IN std_logic_vector(12 downto 0);          
		seuOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT AluMux
	PORT(
		CRS2 : IN std_logic_vector(31 downto 0);
		SEU : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	signal out_nPC, out_Adder, in_IM, out_IM, crs1_RF, crs2_RF, in_MUX, out_MUX, DTW: std_logic_vector (31 downto 0); 
	signal out_ALUOP: std_logic_vector (5 downto 0);
   signal wr: std_logic; 	

begin

Inst_AluMux: AluMux PORT MAP(
		CRS2 => crs2_RF ,
		SEU => in_MUX,
		i => out_IM (13) ,
		salida => out_MUX
	);

Inst_SEU: SEU PORT MAP(
		simm13 => out_IM (12 downto 0) ,
		seuOut => in_MUX
	);


Inst_registerFile: registerFile PORT MAP(
		clkFPGA => clk,
		reset => rst ,
		registerSource1 => out_IM (18 downto 14) ,
		registerSource2 => out_IM (4 downto 0),
		registerDestination => out_IM (29 downto 25) ,
		writeEnable => wr,
		dataToWrite => DTW,
		contentRegisterSource1 => crs1_RF ,
		contentRegisterSource2 => crs2_RF
	);


Inst_ALU: ALU PORT MAP(
		crs1 => crs1_RF ,
		inMUX => out_MUX,
		ALUOP => out_ALUOP,
		outALU => DTW
	);

Inst_ControlUnit: ControlUnit PORT MAP(
		op => out_IM (31 downto 30),
		op3 => out_IM (24 downto 19),
		ALUOP => out_ALUOP,
		wrEnRF => wr
	);

Inst_IM: IM PORT MAP(
		clk => clk ,
		address => in_IM,
		reset => rst,
		outInstruction => out_IM 
	);

Inst_PC: PC PORT MAP(
		in_PC => out_nPC ,
		rst => rst ,
		clk => clk,
		out_PC => in_IM
	);


Inst_nPC: nPC PORT MAP(
		in_nPC => out_Adder,
		clk => clk,
		rst => rst,
		out_nPC => out_nPC 
	);


Inst_Adder: Adder PORT MAP(
		op1 => in_Procesador,
		op2 => out_nPC,
		resul => out_Adder
	);
	
	out_Procesador <= DTW;
	
end Arq_Procesador2;

