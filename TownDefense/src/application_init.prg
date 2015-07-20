global	
	string info_string, info_fps;		
	int fpg_AllInOne;

	int wav_shot1;
	int wav_hit1;
	int wav_hit2;
end
	
process init_engine()
begin
	
	set_fps(60,0);
	scale_resolution=05400960;
	set_mode(screen_size.x, screen_size.y, MODE_16BITS);	
	
	LoadResources();
		
	if(OS_ID == OS_WIN32)
		manage_mouse();
	end
	
	#IF DEBUG == true
		write_debug(&info_fps);
		write_debug(&info_string);
	#ENDIF
	
	init_game();
		
	loop
		
		#IF DEBUG == true
			info_string = "Firing : " + firing;
			info_fps = "FPS : " + fps;
		#ENDIF
		
	frame;	
	end
endprocess

process manage_mouse()
begin
	// mouse.file = fpg_AllInOne;
	loop
		if(mouse.left)
			mouse.graph = 2;
		else
			mouse.graph = 1;
		end	
	frame;
	end
endprocess


function LoadResources()
begin
	fpg_load("Assets/AllInOne.fpg", &fpg_AllInOne);
	load_wav("Assets/Sounds/shot1.wav", &wav_shot1);
	// load_wav("Assets/Sounds/hit3.wav", &wav_hit1);
	// load_wav("Assets/Sounds/hit2.wav", &wav_hit2);
end