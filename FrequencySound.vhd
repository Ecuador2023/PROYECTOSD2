library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FrequencySound is
    Port ( Clk : in  STD_LOGIC;
           Clk_932Hz : out  STD_LOGIC;
           Clk_1046Hz : out  STD_LOGIC;
			  Clk_1Hz : out  STD_LOGIC);
end FrequencySound;

architecture Behavioral of FrequencySound is
    signal counter_932Hz : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- 16-bit counter for 53648 Hz
    signal counter_1046Hz : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- 16-bit counter for 47801 Hz
	 signal counter_1Hz : STD_LOGIC_VECTOR(25 downto 0) := (others => '0'); -- 26-bit
	 
    constant COUNT1_932Hz : natural := 53648; -- 50e6 / 932
    constant COUNT1_1046Hz : natural := 47801;   -- 50e6 / 1046
	 constant COUNT1_1Hz : natural := 50000000;   -- 50e6 / 1
	 
	 constant COUNT2_932Hz : natural := 26824; -- 53648 / 2
    constant COUNT2_1046Hz : natural := 23900;   -- 47801 / 2
	 constant COUNT2_1Hz : natural := 25000000;   -- 50e6 / 2

begin
	process
	begin
	 wait until Clk'event and Clk = '0';  -- 932 Hz
		 if counter_932Hz < COUNT1_932Hz -1 then
			 counter_932Hz <= counter_932Hz + 1;
		 else
			 counter_932Hz <= (others=>'0');
		 end if;
		 
		 if counter_932Hz < COUNT2_932Hz then
			 Clk_932Hz <= '0';
		 else
			 Clk_932Hz <= '1';
		 end if;
	end process;

	process
    begin
	 wait until Clk'event and Clk = '0';  -- 1046 Hz
		 if counter_1046Hz < COUNT1_1046Hz -1 then
			 counter_1046Hz <= counter_1046Hz + 1;
		 else
			 counter_1046Hz <= (others=>'0');
		 end if;
		 
		 if counter_1046Hz < COUNT2_1046Hz then
			 Clk_1046Hz <= '0';
		 else
			 Clk_1046Hz <= '1';
		 end if;
	 end process;
	 
	 process
    begin
	 wait until Clk'event and Clk = '0';  -- 1 Hz
		 if counter_1Hz < COUNT1_1Hz -1 then
			 counter_1Hz <= counter_1Hz + 1;
		 else
			 counter_1Hz <= (others=>'0');
		 end if;
		 
		 if counter_1Hz < COUNT2_1Hz then
			 Clk_1Hz <= '0';
		 else
			 Clk_1Hz <= '1';
		 end if;
	 end process;
end Behavioral;