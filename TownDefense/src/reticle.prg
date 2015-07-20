process Reticle()
private
	int arrowDistance;
begin
	loop
		if(touch_info(0, "ACTIVE") > 0.0)
			ReticleArrow(x - arrowDistance * 2, y);
			ReticleArrow(x + arrowDistance * 2, y);
			ReticleArrow(x, y - arrowDistance * 2);
			ReticleArrow(x, y + arrowDistance * 2);
			
			if(arrowDistance > 5) arrowDistance--; end
		else
			arrowDistance = 15;
		end
	frame;	
		x = mouse.x;
		y = mouse.y;
	end
endprocess

process ReticleArrow(x, y)
begin
	file = fpg_AllInOne;
	graph = 3;	
	angle = fget_angle(x, y, father.x, father.y);
	frame;	
endprocess