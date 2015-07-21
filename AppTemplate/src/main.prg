import "mod_text"
import "mod_key"
import "mod_video"

Process Main()
Begin
	set_mode(270,480);
    write(0,270/2,480/2,4,"BennuGD Android application template");

    Repeat
        frame;
    Until(key(_ESC))

End