import "mod_dir";
import "mod_draw";
import "mod_effects";
import "mod_grproc";
import "mod_map";
import "mod_mouse";
import "mod_multi";
import "mod_proc";
import "mod_rand";
import "mod_time";
import "mod_screen";
import "mod_scroll";
import "mod_sound";
import "mod_string";
import "mod_text"; 
import "mod_timers";
import "mod_video";
import "mod_wm";
import "mod_file";
import "mod_joy";
import "mod_math";
import "mod_sys";
import "mod_regex";
import "mod_key";
import "mod_say";


Process Main()
Begin
	set_mode(1080 / 2,1920 / 2);
	x = 1080 / 4;
	y = 1920 / 4;
	size = 200;
	graph=write_in_map(0,"BennuGD Android application template",4);

    Repeat
		angle+=1000;
		if(os_id==1003 and !focus_status)
			idle_android();
		end
        frame;
    Until(key(_ESC))

End

Function idle_android();
Begin
	pause_game();
	while(!focus_status) frame; end
	resume_game();
End


Function pause_game();
Begin
	signal(ALL_PROCESS,s_freeze);
	if(exists(father)) signal(father,s_wakeup); end
End


Function resume_game();
Begin
	signal(ALL_PROCESS,s_wakeup);
End