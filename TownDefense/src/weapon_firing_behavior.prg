global
	int CurrentWeapon = 0;

	struct weapon[1]
		int cadence;
		int damage;
		int speed;
	end = 	5, 30, 25,
			10, 15, 10;		
end

process WeaponFiringBehavior()
private
	int cadenceCounter;
begin
	loop
		if(touch_info(0, "ACTIVE") > 0.0)
			cadenceCounter++;
			if(cadenceCounter > weapon[CurrentWeapon].cadence)
				firing = true;
				cadenceCounter = 0;
			else			
				firing = false;
			end			
		else
			firing = false;
		end
	frame;	
	end
endprocess
