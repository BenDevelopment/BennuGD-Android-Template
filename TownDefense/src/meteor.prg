process Meteor()
private
	int xDestination;
	int fakeAngle;
	int speed;
begin
	Camp = ENEMY_CAMP;
	file = fpg_AllInOne;
	graph = rand(52, 53);		
	resolution = 100;
	
	x = rand(0, screen_size.x) * resolution;
	xDestination = rand(0, screen_size.x) * resolution;
	speed = 5 * resolution;
	y = -100 * resolution;	 
	fakeAngle = fget_angle(x, y, xDestination, screen_size.y * resolution);
	AnimateHit();
	loop
		
		x += get_distx(fakeAngle, speed);
		y += get_disty(fakeAngle, speed);
		
		if(rand(0,5) < 1)
			Dust(x / resolution + get_distx(rand(0, 360000), rand(0, map_info(file, graph, G_WIDTH) / 2)), 
				 y / resolution + get_disty(rand(0, 360000), rand(0, map_info(file, graph, G_WIDTH) / 2)), rand(50,100));
		end
			Dust(x / resolution + get_distx(rand(0, 360000), rand(0, map_info(file, graph, G_WIDTH) / 2)), 
				 y / resolution + get_disty(rand(0, 360000), rand(0, map_info(file, graph, G_WIDTH) / 2)), rand(50,100));
		
	frame;			
		if(Life <= 0)
			Explosion(x / resolution, y / resolution, 50, true);
			break;
		end
	end
endprocess