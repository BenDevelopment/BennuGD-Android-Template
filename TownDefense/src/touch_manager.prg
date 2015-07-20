global
	point touch_dep;
	

function int touch_info(int finger_id, string info)
begin
	if(OS_ID == OS_WIN32)
		switch (info)
			case "ACTIVE":
				return mouse.left;
			end
			case "X":
				return mouse.x;
			end
			case "Y":
				return mouse.y;
			end
		end
			elseif(OS_ID == OS_ANDROID)
				return multi_info(finger_id, info);
	end
endfunction


process manage_touch_dep()
private
	point old_touch;
begin	
    set_text_color(rgb(255, 255, 255));

	loop
		
		if(touch_info(0, "ACTIVE") > 0.0)
			if(old_touch.x == -1 && old_touch.y == -1)
				old_touch.x = touch_info(0, "X");
				old_touch.y = touch_info(0, "Y");	
			end
			touch_dep.x = old_touch.x - touch_info(0, "X");
			touch_dep.y = old_touch.y - touch_info(0, "Y");	
			
		else
			touch_dep.x = touch_dep.x / 1.2;
			touch_dep.y = touch_dep.y / 1.2;	

			old_touch.x = -1;
			old_touch.y = -1;			
		end
		
		if(touch_info(0, "ACTIVE") > 0.0)
			old_touch.x = touch_info(0, "X");
			old_touch.y = touch_info(0, "Y");	
		end	
		
		
		if(OS_ID == OS_WIN32)
			if(key(_right))
				touch_dep.x = 40;
			end
			if(key(_left))
				touch_dep.x = -40;
			end
			if(key(_up))
				touch_dep.y = -40;
			end
			if(key(_down))
				touch_dep.y = 40;
			end
		end
	frame;
	end
endprocess