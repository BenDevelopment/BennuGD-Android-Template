	#define endfunction end
	#define endprocess end
	#define endprogram end
		
	#define DEBUG false

	#define SCREEN_SIZE_X 270
	#define SCREEN_SIZE_Y 480
	
	
	#define FRIEND_CAMP 0
	#define ENEMY_CAMP 1
	
	import "mod_video"
	import "mod_key"
	import "mod_text"
	import "mod_sound"
	import "mod_wm"
	import "mod_map"
	import "mod_draw"
	import "mod_say"
	import "mod_file"
	import "mod_text"
	import "mod_multi"
	import "mod_mouse"
	import "mod_proc"
	import "mod_screen"
	import "mod_rand"
	import "mod_grproc"
	import "mod_math"
	import "mod_scroll"	
	import "mod_blendop"
	import "mod_effects"
	
	include "extra_types.prg"
	include "utils.prg"
	
	local
		int Life = 100;
		int Damage = 10;
		int CollisionId;
		int Camp;
	end

	global	
		point screen_size = SCREEN_SIZE_X, SCREEN_SIZE_Y;
		int DomeId, TownId;	
		int firing;
	end

	include "application_init.prg"
	include "common.prg"
	
	include "weapon_firing_behavior.prg"
	include "meteor.prg"
	include "enemy.prg"
	include "bullet.prg"
	include "dome.prg"
	include "town.prg"
	include "reticle.prg"
	include "canon.prg"
	
	include "touch_manager.prg"
	include "game_init.prg"
	include "debug_manager.prg"

	begin
		init_engine();
	loop
		if(key(_esc))
			exit(0,0);
		end
		frame;
	end
endprogram
