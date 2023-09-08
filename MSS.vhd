library ieee;
use ieee.std_logic_1164.all;
entity MSS is
	port(Clock,Resetn,Cancion,Empezar,Ok,Final_RAM,Cambiar,Encontrado,Final_ROM: in std_logic;
		  En_min_decena,En_min_unidad,En_min,RW_Minuto,En_seg_decena,En_seg_unidad,En_seg,RW_Segundo,En_BPM_centena,En_BPM_decena,En_BPM_unidad,
		  En_BPM,RW_BPM,En_Compas,RW_Compas,En_display_minutos,En_display_segundos,En_display_BPM,En_display_compas,En_Max_RAM,En_Dir_RAM,Ld_Dir_RAM,
		  Reset_Reloj,Reset_frecuencia,En_buzzer,En_Leds,En_Cancion_Escuchar,En_Dir_ROM,Ld_Dir_ROM,S1,S0,En_display_Cancion: out std_logic);
end MSS;

architecture Controlador of MSS is 
type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Too,Tp,Tq,Tr,Ts,Tt,Tu,Tv,Tw,Tx,Ty,Tz,
					 Taa,Tab,Tac,Tad,Tae,Taf,Tag,Tah,Tai,Taj,Tak,Tal,Tam,Tan,Tao,Tap,Taq,Tar,Tas,Tat,Tau,Tav,Taw,Tax,Tay,Taz,
					 Tba,Tbb,Tbc,Tbd,Tbe,Tbf,Tbg,Tbh,Tbi);
signal y: estado;
begin
	process(Clock, Resetn)
	begin
		if Resetn='0' then y<=Ta;
		elsif (Clock' event and Clock='1') then
			case y is
				when Ta=> if Cancion='1' then y<= Tap; else y<= Tb; end if;
				when Tb=> if Empezar='0' and Ok='0' then y<= Ta;
							 elsif Empezar='0' and Ok='1' then y<= Tc;
							 else y<= Tak; end if;
				when Tc=> if Ok='0' then y<= Td; else y<= Tc; end if;
				when Td=> y<= Te;
				when Te=> if Ok='1' then y<= Tf; else y<= Te; end if;
				when Tf=> if Ok='0' then y<= Tg; else y<= Tf; end if;
				when Tg=> y<= Th;
				when Th=> y<= Ti;
				when Ti=> y<= Tj;
				when Tj=> if Ok='1' then y<= Tk; else y<= Tj; end if;
				when Tk=> if Ok='0' then y<= Tl; else y<= Tk; end if;   
				when Tl=> y<= Tm;
				when Tm=> if Ok='1' then y<= Tn; else y<= Tm; end if;
				when Tn=> if Ok='0' then y<= Too; else y<= Tn; end if;   
				when Too=> y<= Tp;
				when Tp=> y<= Tq;
				when Tq=>  y<= Tr;
				when Tr=> if Ok='1' then y<= Ts; else y<= Tr; end if;
				when Ts=> if Ok='0' then y<= Tt; else y<= Ts; end if;   
				when Tt=> y<= Tu;
				when Tu=> if Ok='1' then y<= Tv; else y<= Tu; end if;
				when Tv=> if Ok='0' then y<= Tw; else y<= Tv; end if;   
				when Tw=> y<= Tx;
				when Tx=> if Ok='1' then y<= Ty; else y<= Tx; end if;
				when Ty=> if Ok='0' then y<= Tz; else y<= Ty; end if;
				when Tz=> y<= Taa;
				when Taa=> y<= Tab;
				when Tab=> y<= Tac;
				when Tac=> if Ok='1' then y<= Tad; else y<= Tac; end if;
				when Tad=> if Ok='0' then y<= Tae; else y<= Tad; end if; 
				when Tae=> y<= Taf;
				when Taf=> y<= Tag;
				when Tag=> if Ok='1' then y<= Tah; else y<= Tag; end if;
				when Tah=> if Ok='0' then y<= Tai; else y<= Tah; end if;
				when Tai=> y<= Taj;
				when Taj=> y<= Ta;
				when Tak=> if Empezar='0' then y<= Tal; else y<= Tak; end if;
				when Tal=> y<= Tam;
				when Tam=> if Final_RAM='0' and Cambiar='0' then y<= Tam;
							 elsif Final_RAM='0' and  Cambiar='1' then y<= Tan;
							 else y<= Tao; end if;
				when Tan=> y<= Tam;
				when Tao=> y<= Ta;
				when Tap=> if Cancion='0' then y<= Taq; else y<= Tap; end if;
				when Taq=> if Ok='1' then y<= Tar; else y<= Taq; end if;
				when Tar=> if Ok='0' then y<= Tas; else y<= Tar; end if;
				when Tas=> y<= Tat;
				when Tat=> if Empezar='1' then y<= Tau; else y<= Tat; end if;
				when Tau=> if Empezar='0' then y<= Tav; else y<= Tau; end if;
				when Tav=> y<= Taw;
				when Taw=> if Encontrado='1' then y<= Tay; else y<= Tax; end if;
				when Tax=> y<= Taw;
				when Tay=> y<= Taz;
				when Taz=> y<= Tba;
				when Tba=> y<= Tbb;
				when Tbb=> y<= Tbc;
				when Tbc=> y<= Tbd;
				when Tbd=> y<= Tbe;
				when Tbe=> y<= Tbf;
				when Tbf=> y<= Tbg;
				when Tbg=> y<= Tbh;
				when Tbh=> if Final_ROM='1' then y<= Tal; else y<= Tbi; end if;
				when Tbi=> y<= Taz;
			end case;
		end if;
	end process;
	
	process(y)
	begin
	En_min_decena<= '0'; En_min_unidad<= '0'; En_min<= '0'; RW_Minuto<= '0'; En_seg_decena<= '0'; En_seg_unidad<= '0'; En_seg<= '0'; RW_Segundo<= '0'; 
	En_BPM_centena<= '0'; En_BPM_decena<= '0'; En_BPM_unidad<= '0'; En_BPM<= '0'; RW_BPM<= '0'; En_Compas<= '0'; RW_Compas<= '0'; En_display_minutos<= '0'; 
	En_display_segundos<= '0'; En_display_BPM<= '0'; En_display_compas<= '0'; En_Max_RAM<= '0'; En_Dir_RAM<= '0'; Ld_Dir_RAM<= '0'; Reset_Reloj<= '0'; 
	Reset_frecuencia<= '0'; En_buzzer<= '0'; En_Leds<= '0'; En_Cancion_Escuchar<= '0'; En_Dir_ROM<= '0'; Ld_Dir_ROM<= '0'; S1<= '0'; S0<= '0'; En_display_Cancion<= '0'; 
		case y is
			when Ta=> 
			when Tb=> 
			when Tc=> 
			when Td=> En_min_decena<= '1';
			when Te=>  
			when Tf=>   
			when Tg=> En_min_unidad<= '1';
			when Th=> En_min<= '1';
			when Ti=> RW_Minuto<= '1';
			when Tj=> En_display_minutos<= '1';
			when Tk=> En_display_minutos<= '1';
			when Tl=> En_seg_decena<= '1';En_display_minutos<= '1';
			when Tm=> En_display_minutos<= '1';
			when Tn=> En_display_minutos<= '1';
			when Too=> En_seg_unidad<= '1'; En_display_minutos<= '1';
			when Tp=> En_seg<= '1'; En_display_minutos<= '1';
			when Tq=> RW_Segundo<= '1'; En_display_minutos<= '1';
			when Tr=> En_display_minutos<= '1'; En_display_segundos<= '1';
			when Ts=> En_display_minutos<= '1'; En_display_segundos<= '1';
			when Tt=> En_BPM_centena<= '1'; En_display_minutos<= '1'; En_display_segundos<= '1';
			when Tu=> En_display_minutos<= '1'; En_display_segundos<= '1';
			when Tv=> En_display_minutos<= '1'; En_display_segundos<= '1';
			when Tw=> En_BPM_decena<= '1'; En_display_minutos<= '1'; En_display_segundos<= '1';
			when Tx=> En_display_minutos<= '1'; En_display_segundos<= '1';
			when Ty=> En_display_minutos<= '1'; En_display_segundos<= '1';
			when Tz=> En_BPM_unidad<= '1'; En_display_minutos<= '1'; En_display_segundos<= '1';
			when Taa=> En_BPM<= '1'; En_display_minutos<= '1'; En_display_segundos<= '1';
			when Tab=> RW_BPM<= '1'; En_display_minutos<= '1'; En_display_segundos<= '1';
			when Tac=> En_display_minutos<= '1'; En_display_segundos<= '1'; En_display_BPM<= '1';
			when Tad=> En_display_minutos<= '1'; En_display_segundos<= '1'; En_display_BPM<= '1';
			when Tae=> En_Compas<= '1'; En_display_minutos<= '1'; En_display_segundos<= '1'; En_display_BPM<= '1';
			when Taf=> RW_Compas<= '1'; En_display_minutos<= '1'; En_display_segundos<= '1'; En_display_BPM<= '1';
			when Tag=> En_display_minutos<= '1'; En_display_segundos<= '1'; En_display_BPM<= '1'; En_display_compas<= '1';
			when Tah=> 
			when Tai=> En_Max_RAM<= '1'; 
			when Taj=> En_Dir_RAM<= '1';
			when Tak=> 
			when Tal=> En_Dir_RAM<= '1'; Ld_Dir_RAM<= '1'; Reset_Reloj<= '1'; Reset_frecuencia<= '1'; S1<= '1'; En_Dir_ROM<= '1'; Ld_Dir_ROM<= '1'; 
			when Tam=> En_buzzer<= '1'; En_Leds<= '1'; S1<= '1'; En_display_minutos<= '1'; En_display_segundos<= '1'; En_display_BPM<= '1'; En_display_compas<= '1';
			when Tan=> Reset_frecuencia<= '1'; En_Dir_RAM<= '1'; S1<= '1'; En_display_minutos<= '1'; En_display_segundos<= '1'; En_display_BPM<= '1'; En_display_compas<= '1';
			when Tao=> En_Dir_RAM<= '1'; Ld_Dir_RAM<= '1'; 
			when Tap=> 
			when Taq=> 
			when Tar=> 
			when Tas=> En_Cancion_Escuchar<= '1';
			when Tat=> En_display_Cancion<= '1';
			when Tau=> 
			when Tav=> En_Dir_RAM<= '1'; Ld_Dir_RAM<= '1';  
			when Taw=> 
			when Tax=> En_Dir_ROM<= '1';
			when Tay=> S0<= '1'; En_Dir_ROM<= '1';
			when Taz=> S0<= '1';RW_Minuto<= '1';
			when Tba=> S0<= '1'; En_Dir_ROM<= '1';
			when Tbb=> S0<= '1'; RW_Segundo<= '1';
			when Tbc=> S0<= '1'; En_Dir_ROM<= '1';
			when Tbd=> S0<= '1'; RW_BPM<= '1'; 
			when Tbe=> S0<= '1'; En_Dir_ROM<= '1';
			when Tbf=> S0<= '1'; RW_Compas<= '1'; 
			when Tbg=> S0<= '1'; En_Dir_ROM<= '1';
			when Tbh=> S0<= '1';
			when Tbi=> S0<= '1'; En_Dir_RAM<= '1';
		end case;
	end process;
end Controlador;