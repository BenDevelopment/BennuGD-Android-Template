process Canon()
begin

	z = -10;
	x = screen_size.x / 2 -1;
	y = screen_size.y - 27;
	
	WeaponFiringBehavior();
	
	PlinthCanon();
	BaseCanon();
	PistonCanon();
	RailCanon();
		
	loop
		if(touch_info(0, "ACTIVE") > 0.0)
			angle = near_angle(angle, fget_angle(x, y, touch_info(0, "X"), touch_info(0, "Y")), 5000);
		else
			angle = near_angle(angle, fget_angle(x, y, x, y - 20), 5000);
		end
	frame;	
	end
endprocess

// Le socle du canon
process PlinthCanon()
begin
	file = fpg_AllInOne;
	graph = 31;	
	z = father.z;
	x = father.x;
	y = father.y + 20;
	loop	
	frame;	
	end
endprocess

// La base du canon (la partie rouge)
process BaseCanon()
begin
	file = fpg_AllInOne;
	graph = 32;	
	z = father.z - 3;
	loop	
		x = father.x;
		y = father.y;
		angle = father.angle;
	frame;	
	end
endprocess


// Le piston du canon (la partie grise)
process PistonCanon()
private
	int distanceMax;
	int distance;
begin
	file = fpg_AllInOne;
	graph = 33;	
	z = father.z - 2;
	distanceMax = 27;
	resolution = 1;
	loop	
		x = father.x + get_distx(father.angle, distance);
		y = father.y + get_disty(father.angle, distance);
		angle = father.angle;
		
		if(firing)
			// play_wav(wav_shot1,0);
			Bullet(angle + rand (-2000, 2000));
			Blast(x + get_distx(angle, 14), y + get_disty(angle, 14), 50);
			distance -= 10;
		end
		
		if(distance < 18) distance = 18; end
		if(distance < distanceMax) distance++; end
	frame;	
	end
endprocess


// Le rail canon (la partie bleu)
process RailCanon()
private
	int distance;
begin
	file = fpg_AllInOne;
	graph = 34;	
	z = father.z - 1;
	distance = 28;
	loop	
		x = father.x + get_distx(father.angle, distance);
		y = father.y + get_disty(father.angle, distance);
		angle = father.angle;
	frame;	
	end
endprocess