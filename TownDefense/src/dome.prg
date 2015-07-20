process Dome()
begin
	Camp = FRIEND_CAMP;
	file = fpg_AllInOne;
	graph = 21;		
	x = screen_size.x / 2 - 1;
	y = screen_size.y - 7;
	alpha=100;
	z = TownId.z - 100;
	AnimateHit();
	loop
		if(CollisionId = collision(type meteor))
			CollisionId.Life -= 30;
			Life--;
		end
	frame;	
	end
endprocess