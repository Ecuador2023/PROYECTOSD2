-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "08/14/2023 14:58:18"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Diagram
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Diagram_vhd_vec_tst IS
END Diagram_vhd_vec_tst;
ARCHITECTURE Diagram_arch OF Diagram_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Buzzer : STD_LOGIC;
SIGNAL Cambiar : STD_LOGIC;
SIGNAL Cancion : STD_LOGIC;
SIGNAL Clk_1Hz : STD_LOGIC;
SIGNAL Clk_932Hz : STD_LOGIC;
SIGNAL Clk_1046Hz : STD_LOGIC;
SIGNAL Clock : STD_LOGIC;
SIGNAL Contador : STD_LOGIC_VECTOR(26 DOWNTO 0);
SIGNAL Display_BPM : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL Display_Cancion : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Display_compas : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Display_minutos : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Display_segundos : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Empezar : STD_LOGIC;
SIGNAL Frecuencia : STD_LOGIC_VECTOR(26 DOWNTO 0);
SIGNAL Led1 : STD_LOGIC;
SIGNAL Led2 : STD_LOGIC;
SIGNAL Led3 : STD_LOGIC;
SIGNAL Led4 : STD_LOGIC;
SIGNAL Ok : STD_LOGIC;
SIGNAL Resetn : STD_LOGIC;
SIGNAL Teclado : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT Diagram
	PORT (
	Buzzer : OUT STD_LOGIC;
	Cambiar : OUT STD_LOGIC;
	Cancion : IN STD_LOGIC;
	Clk_1Hz : IN STD_LOGIC;
	Clk_932Hz : IN STD_LOGIC;
	Clk_1046Hz : IN STD_LOGIC;
	Clock : IN STD_LOGIC;
	Contador : OUT STD_LOGIC_VECTOR(26 DOWNTO 0);
	Display_BPM : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
	Display_Cancion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display_compas : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display_minutos : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Display_segundos : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Empezar : IN STD_LOGIC;
	Frecuencia : OUT STD_LOGIC_VECTOR(26 DOWNTO 0);
	Led1 : OUT STD_LOGIC;
	Led2 : OUT STD_LOGIC;
	Led3 : OUT STD_LOGIC;
	Led4 : OUT STD_LOGIC;
	Ok : IN STD_LOGIC;
	Resetn : IN STD_LOGIC;
	Teclado : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Diagram
	PORT MAP (
-- list connections between master ports and signals
	Buzzer => Buzzer,
	Cambiar => Cambiar,
	Cancion => Cancion,
	Clk_1Hz => Clk_1Hz,
	Clk_932Hz => Clk_932Hz,
	Clk_1046Hz => Clk_1046Hz,
	Clock => Clock,
	Contador => Contador,
	Display_BPM => Display_BPM,
	Display_Cancion => Display_Cancion,
	Display_compas => Display_compas,
	Display_minutos => Display_minutos,
	Display_segundos => Display_segundos,
	Empezar => Empezar,
	Frecuencia => Frecuencia,
	Led1 => Led1,
	Led2 => Led2,
	Led3 => Led3,
	Led4 => Led4,
	Ok => Ok,
	Resetn => Resetn,
	Teclado => Teclado
	);

-- Resetn
t_prcs_Resetn: PROCESS
BEGIN
	Resetn <= '0';
	WAIT FOR 10000 ps;
	Resetn <= '1';
WAIT;
END PROCESS t_prcs_Resetn;

-- Clock
t_prcs_Clock: PROCESS
BEGIN
LOOP
	Clock <= '0';
	WAIT FOR 5000 ps;
	Clock <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 3000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clock;

-- Clk_1Hz
t_prcs_Clk_1Hz: PROCESS
BEGIN
LOOP
	Clk_1Hz <= '0';
	WAIT FOR 5000 ps;
	Clk_1Hz <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 3000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clk_1Hz;

-- Clk_932Hz
t_prcs_Clk_932Hz: PROCESS
BEGIN
LOOP
	Clk_932Hz <= '0';
	WAIT FOR 2000 ps;
	Clk_932Hz <= '1';
	WAIT FOR 2000 ps;
	IF (NOW >= 3000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clk_932Hz;

-- Clk_1046Hz
t_prcs_Clk_1046Hz: PROCESS
BEGIN
LOOP
	Clk_1046Hz <= '0';
	WAIT FOR 500 ps;
	Clk_1046Hz <= '1';
	WAIT FOR 500 ps;
	IF (NOW >= 3000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clk_1046Hz;
-- Teclado[3]
t_prcs_Teclado_3: PROCESS
BEGIN
	Teclado(3) <= '0';
	WAIT FOR 260000 ps;
	Teclado(3) <= '1';
	WAIT FOR 160000 ps;
	Teclado(3) <= '0';
	WAIT FOR 370000 ps;
	Teclado(3) <= '1';
	WAIT FOR 170000 ps;
	Teclado(3) <= '0';
WAIT;
END PROCESS t_prcs_Teclado_3;
-- Teclado[2]
t_prcs_Teclado_2: PROCESS
BEGIN
	Teclado(2) <= '0';
	WAIT FOR 190000 ps;
	Teclado(2) <= '1';
	WAIT FOR 70000 ps;
	Teclado(2) <= '0';
	WAIT FOR 410000 ps;
	Teclado(2) <= '1';
	WAIT FOR 120000 ps;
	Teclado(2) <= '0';
	WAIT FOR 170000 ps;
	Teclado(2) <= '1';
	WAIT FOR 70000 ps;
	Teclado(2) <= '0';
WAIT;
END PROCESS t_prcs_Teclado_2;
-- Teclado[1]
t_prcs_Teclado_1: PROCESS
BEGIN
	Teclado(1) <= '0';
	WAIT FOR 140000 ps;
	Teclado(1) <= '1';
	WAIT FOR 50000 ps;
	Teclado(1) <= '0';
	WAIT FOR 230000 ps;
	Teclado(1) <= '1';
	WAIT FOR 80000 ps;
	Teclado(1) <= '0';
	WAIT FOR 100000 ps;
	Teclado(1) <= '1';
	WAIT FOR 70000 ps;
	Teclado(1) <= '0';
WAIT;
END PROCESS t_prcs_Teclado_1;
-- Teclado[0]
t_prcs_Teclado_0: PROCESS
BEGIN
	Teclado(0) <= '0';
	WAIT FOR 70000 ps;
	Teclado(0) <= '1';
	WAIT FOR 70000 ps;
	Teclado(0) <= '0';
	WAIT FOR 50000 ps;
	Teclado(0) <= '1';
	WAIT FOR 310000 ps;
	Teclado(0) <= '0';
	WAIT FOR 220000 ps;
	Teclado(0) <= '1';
	WAIT FOR 170000 ps;
	Teclado(0) <= '0';
WAIT;
END PROCESS t_prcs_Teclado_0;

-- Empezar
t_prcs_Empezar: PROCESS
BEGIN
	Empezar <= '0';
	WAIT FOR 1080000 ps;
	Empezar <= '1';
	WAIT FOR 20000 ps;
	Empezar <= '0';
WAIT;
END PROCESS t_prcs_Empezar;

-- Ok
t_prcs_Ok: PROCESS
BEGIN
	Ok <= '0';
	WAIT FOR 20000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 30000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 50000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 30000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 50000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 20000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 30000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 50000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 40000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 50000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 30000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 50000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 30000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 50000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 30000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 30000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 50000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
	WAIT FOR 40000 ps;
	Ok <= '1';
	WAIT FOR 20000 ps;
	Ok <= '0';
WAIT;
END PROCESS t_prcs_Ok;

-- Cancion
t_prcs_Cancion: PROCESS
BEGIN
	Cancion <= '0';
WAIT;
END PROCESS t_prcs_Cancion;
END Diagram_arch;
