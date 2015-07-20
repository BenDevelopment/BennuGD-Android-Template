process EnemyShip()
private
	int border_distance = 32;
	int row_height = 40;
	int index;
	point nextPoint;
	bool breakLoop;
	point pattern[29] = 
			0,-1,
			0,1,
			1,1,
			1,2,
			0,2,
			0,3,
			1,3,
			1,4,
			0,4,
			0,5,
			1,5,
			1,6,
			0,6,
			0,7,
			1,7,
			1,6,
			0,6,
			0,5,
			1,5,
			1,4,
			0,4,
			0,3,
			1,3,
			1,2,
			0,2,
			0,1,
			1,1,
			1,0;
begin
	Camp = ENEMY_CAMP;
	life = 1000;
	file = fpg_AllInOne;
	graph = 91;		
	resolution = 10;
	x = border_distance;
	y = -100;
	AnimateHit();
	
	loop
	
	nextPoint.x = pattern[index].x * (screen_size.x - border_distance * 2) + border_distance;
	nextPoint.y = pattern[index].y * row_height;
	
	x+= get_distx(fget_angle(x, y, nextPoint.x * resolution, nextPoint.y * resolution), 3 * resolution);
	y+= get_disty(fget_angle(x, y, nextPoint.x * resolution, nextPoint.y * resolution), 3 * resolution);
	
	if(fget_dist(x, y, nextPoint.x * resolution, nextPoint.y * resolution) < 2 * resolution)
		if(breakLoop)
			index++;
			if(index > 25)
				index = 2;
			end
			breakLoop = false;
		end
	else
		breakLoop = true;
	end
	
	if(rand(0, 100) < 1)
		Bullet(-90000);
	end
	
	frame;			
		if(Life <= 0)
			Explosion(x / resolution, y / resolution, 50, true);
			break;
		end
	end
endprocess
