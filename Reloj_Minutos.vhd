library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Reloj_Minutos is
port (Resetn: in std_logic;
		Clock: in std_logic;
		Minuto: buffer std_logic_vector(5 downto 0));
end Reloj_Minutos;

architecture Desarrollo of Reloj_Minutos is
begin
	process(Resetn,Clock)
		begin
		if Resetn='0' then Minuto<=(others=>'0');
		elsif (Clock'event and Clock='1') then Minuto<=Minuto+1;
			if (Minuto="111011") then Minuto<=(others=>'0'); end if;
		end  if;
	end process;
end Desarrollo;