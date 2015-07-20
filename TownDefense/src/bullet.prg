process Bullet(angle)
private
	int speed;
begin
	Camp = father.Camp;
	file = fpg_AllInOne;
	graph = 41;	
	z = father.z + 1;
	//angle = father.angle + rand (-2000, 2000);
	resolution = 100;
	x = father.x * resolution / father.resolution;
	y = father.y * resolution / father.resolution;
	Damage = weapon[CurrentWeapon].damage;
	speed = weapon[CurrentWeapon].speed + rand(-5,5);
	loop
		x += get_distx(angle, speed * resolution);
		y += get_disty(angle, speed * resolution);
		
		if(CollisionId = collision(type Meteor))
			if(CollisionId.Camp != id.Camp)
				CollisionId.Life -= Damage;
				Life = 0;
			end
		end		
		
		if(CollisionId = collision(type EnemyShip))
			if(CollisionId.Camp != id.Camp)
				CollisionId.Life -= Damage;
				Life = 0;
			end
		end		
		
		if(CollisionId = collision(type Dome))
			if(CollisionId.Camp != id.Camp)
				CollisionId.Life -= Damage;
				Life = 0;
			end
		end
		
		if(out_region(id, 0))
			break;
		end
		
	frame;	
		if(Life <= 0)
			// play_wav(wav_hit1,0);
			Blast(x / resolution, y / resolution, 100);
			for(z = 0; z < 5; z++)
				Particle(angle);
			end
			break;
		end
	end
endprocess


process Blast(x, y, size)
begin
	file = fpg_AllInOne;
	graph = 61;	
	z = father.z - 1;
	// x = father.x / father.resolution;
	// y = father.y / father.resolution;
	angle = rand(0, 360000);
	while(graph < 64)
		graph++;
		frame(200);
	end
endprocess



process Dust(x, y, size)
begin
	file = fpg_AllInOne;
	graph = 71;	
	z = father.z - 1;
	angle = rand(0, 360000);
	alpha = 70;
	while(graph < 76)
		graph++;
		alpha -= 8;
		frame(200);
	end
endprocess



process Explosion(x, y, size, showShockWave)
begin
	file = fpg_AllInOne;
	graph = 81;	
	z = father.z - 1;
	angle = rand(0, 360000);
	if(showShockWave)
		ShockWave(x, y);
	end
	while(graph < 88)
		graph++;
		frame(200);
	end
endprocess


process ShockWave(x, y)
private
	int incr;
begin
	size = 0;
	incr = 40;
	z = father.z - 1;
	drawing_z(z);
	drawing_alpha(255);
	drawing_color(rgb(255,255,255));
	loop
		alpha = draw_circle(x, y, size/2);
		size += incr / 4;
		incr--;
		if(size > 100 || incr < 1)
			delete_draw(alpha);
			break;
		end
	frame;
		delete_draw(alpha);
	end
endprocess



process Particle(baseAngle)
private
	int speed;
	int nAngle;
begin
	speed = rand(40, 60);
	file = fpg_AllInOne;
	graph = 5;	
	size = rand(1, 2) * 100;
	resolution = 100;
	z = father.z - 1;
	x = father.x;
	y = father.y;
	
	if(baseAngle == null)
		nAngle = rand(0, 360000);
	else
		nAngle = -baseAngle + rand(-35000, +35000);		
	end
	
	while(speed > 0)
		speed-=2;
		x += get_distx(nAngle, speed * 6);
		y += get_disty(nAngle, speed * 6);
		frame;
	end
endprocess




