library ieee;    
use ieee.std_logic_1164.all;    
  
entity Buffer_tristate is  
port (Entrada: in std_logic;
      En: in std_logic;
      Salida: out std_logic);
end Buffer_tristate;
    
architecture Solucion of Buffer_tristate is
begin
   Salida<= 'Z' when En='0' else Entrada;
end Solucion;