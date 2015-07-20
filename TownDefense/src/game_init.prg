process init_game()
begin
	
	drawing_alpha(80);
	TownId = Town();
	DomeId = Dome();
	Reticle();
	Canon();
	put(fpg_AllInOne, 4, screen_size.x / 2, screen_size.y / 2);
	EnemyShip();
	loop
		// if(rand(0,100) < 1)
			// Meteor();
		// end
	frame;	
	end
endprocess