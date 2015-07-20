import "mod_dir";
import "mod_draw";
import "mod_file";
import "mod_grproc";
import "mod_joy";
import "mod_key";
import "mod_map";
import "mod_math";
import "mod_mouse";
import "mod_proc";
import "mod_rand";
import "mod_regex";
import "mod_say";
import "mod_screen";
import "mod_sound";
import "mod_string";
import "mod_sys";
import "mod_text";
import "mod_time";
import "mod_timers";
import "mod_video";
import "mod_wm";

Private
	string nombre;
	folder;
Begin
	set_mode(100,100,argv[1]);
	frame;
	if(argv[2]=="")
		folder=diropen("*.");
		loop
			nombre=dirread(folder);
			if(nombre=="") break; end
			if(nombre!=".." and nombre!=".")
				say(nombre);
				procesa(nombre);
			end
		end
	else
		from x=2 to argc-1;
			say("Compilando "+argv[x]+".fpg...");
			procesa(argv[x]);
		end
	end
End

Function procesa(string fpgname);
Private
	i;
	j;
	temp;
	string nombre;
Begin
	if(fpgname=="") return; end
	chdir(fpgname);
	file=fpg_new();
	from x=0 to 999;
		nombre="";
		If(file_exists(itoa(x)+".png"))
			nombre=itoa(x)+".png";
		elseIf(file_exists("0"+itoa(x)+".png"))
			nombre="0"+itoa(x)+".png";
		elseIf(file_exists("00"+itoa(x)+".png"))
			nombre="00"+itoa(x)+".png";
		end
		if(nombre!="")
			temp=load_png(nombre);
			if(temp>0)
				fpg_add(file,x,0,temp);
				unload_map(0,temp);
			else
				say("Error cargando "+fpgname+":"+nombre);
			end
		end
	End
	if(!save_fpg(file,"../../fpg/"+fpgname+".fpg"))
		say("Error guardando "+fpgname+".fpg");
	end
	unload_fpg(file);
	chdir("..");
End