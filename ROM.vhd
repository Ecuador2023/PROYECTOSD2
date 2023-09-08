library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ROM is
port (Address: in std_logic_vector (6 downto 0);
		Data: out std_logic_vector(14 downto 0));
end ROM;

architecture Solucion of ROM is
type Ram_table is array (0 to 127) of std_logic_vector(14 downto 0);
signal Rammemory: Ram_table;
attribute ram_init_file: string;
attribute ram_init_file of Rammemory: signal is "Canciones.hex";
begin
	Data<= Rammemory(conv_integer(Address));
end solucion;