library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Reloj_Segundos is
port (Resetn: in std_logic;
		Clock: in std_logic;
		Segundo: buffer std_logic_vector(5 downto 0);
		Fin: out std_logic);
end Reloj_Segundos;

architecture Desarrollo of Reloj_Segundos is
begin
	process(Resetn,Clock)
		begin
		if Resetn='0' then Segundo<=(others=>'0'); Fin<='0';
		elsif (Clock'event and Clock='1') then Segundo<=Segundo+1; Fin<='0';
			if (Segundo="111011") then Segundo<=(others=>'0'); Fin<='1'; end if;
		end  if;
	end process;
end Desarrollo;