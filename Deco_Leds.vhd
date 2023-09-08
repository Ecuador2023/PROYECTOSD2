library ieee;
use ieee.std_logic_1164.all;

entity Deco_Leds is
port(BCD: in std_logic_vector(2 downto 0);
	  Y3,Y2,Y1,Y0: out std_logic);
end Deco_Leds;

architecture arq of Deco_Leds is
signal temp: std_logic_vector(3 downto 0);
begin
process(BCD)
begin
	case BCD is
		when "001" => temp<="1000";
		when "010" => temp<="0100";
		when "011" => temp<="0010";
		when "100" => temp<="0001";
		when others => temp<="0000";
	end case;
end process;
Y3<=temp(3);
Y2<=temp(2);
Y1<=temp(1);
Y0<=temp(0);
end arq;