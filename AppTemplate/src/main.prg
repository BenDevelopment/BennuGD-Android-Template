import "mod_text"
import "mod_key"
import "mod_video"

Process Main()
Begin
	set_mode(1080 / 2,1920 / 2);
	x = 1080 / 4;
	y = 1920 / 4;
	size = 200;
	graph=write_in_map(0,"BennuGD Android application template",4);

    Repeat
		angle+=1000;
        frame;
    Until(key(_ESC))

End