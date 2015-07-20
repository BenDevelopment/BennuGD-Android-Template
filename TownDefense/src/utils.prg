global
	int clicked_object_id = 0;
	point last_click_position;
end	

local
	point graph_size = -1, -1;
end

function int count_instance(int T)
begin
	while(get_id(T))
		y++;
	end
	return y;
endfunction

function int has_son_of_type(int T)
begin
	while(x=get_id(T))
		if(father == x.father)
		return true;
		end
	end
	return false;
endfunction

function int on_clicking()
private
	point click_position;
	point map_size;
begin
	if(touch_info(0, "ACTIVE") > 0.0)
		click_position.x = (father.ctype == c_scroll) ? touch_info(0, "X") + scroll[0].x0 : touch_info(0, "X");
		click_position.y = (father.ctype == c_scroll) ? touch_info(0, "Y") + scroll[0].y0 : touch_info(0, "Y");
		map_size.x = map_info(father.file, father.graph, G_WIDTH);
		map_size.y = map_info(father.file, father.graph, G_HEIGHT);
		
		if(	click_position.x > father.x - map_size.x / 2 && click_position.x < father.x + map_size.x / 2 &&
			click_position.y > father.y - map_size.y / 2 && click_position.y < father.y + map_size.y / 2)
			return true;
		end		
	end
	return false;
endfunction

function int on_click(int proc_id)
private
	point map_size;
begin
	if(touch_info(0, "ACTIVE") > 0.0)
		
		last_click_position.x = (proc_id.ctype == c_scroll) ? touch_info(0, "X") + scroll[0].x0 : touch_info(0, "X");
		last_click_position.y = (proc_id.ctype == c_scroll) ? touch_info(0, "Y") + scroll[0].y0 : touch_info(0, "Y");
		
			// say(rand(0,1) + " " + proc_id);
		if(clicked_object_id == 0 && is_point_hover_object(last_click_position, proc_id))
			clicked_object_id = proc_id;
		end
	else	
		if(clicked_object_id != 0  && clicked_object_id == proc_id && is_point_hover_object(last_click_position, clicked_object_id))
			clicked_object_id = 0;
			return true;		
		end
		if(clicked_object_id != 0  && !is_point_hover_object(last_click_position, clicked_object_id))
			clicked_object_id = 0;	
		end
	end
	return false;
endfunction

function int is_point_hover_object(point p, int proc_id)
private
begin
	graph_size_lazy_loading(proc_id);
	
	if(	p.x > proc_id.x - proc_id.graph_size.x / 2 && p.x < proc_id.x + proc_id.graph_size.x / 2 &&
		p.y > proc_id.y - proc_id.graph_size.y / 2 && p.y < proc_id.y + proc_id.graph_size.y / 2)
		return true;
	end
	return false;
endfunction

function graph_size_lazy_loading(int proc_id)
begin
	if(proc_id.graph_size.x == -1 || proc_id.graph_size.y == -1)
		proc_id.graph_size.x = map_info(proc_id.file, proc_id.graph, G_WIDTH);
		proc_id.graph_size.y = map_info(proc_id.file, proc_id.graph, G_HEIGHT);
	end
endfunction

process translate(int proc_id, int destination_x, int destination_y, int speed_percent, int reverse)
private
	point start_point;
	point translate_reverse[1000];
	int is_reversing = false;
begin
	start_point.x = proc_id.x;
	start_point.y = proc_id.y;
	loop
		if(!exists(proc_id))
			break;
		end		
		
		if((proc_id.y - destination_y)/10 == 0 || (proc_id.y - destination_y)/10 == 0)		
			is_reversing = true;		
		end
		
		if(!is_reversing)
		
			if(reverse)
				translate_reverse[x].x = proc_id.x;
				translate_reverse[x].y = proc_id.y;
			end
			x++;
			
			proc_id.x -= (proc_id.x - destination_x)/10;
			proc_id.y -= (proc_id.y - destination_y)/10;		
		
		else
			if(reverse)
				x--;
				proc_id.x = translate_reverse[x].x;
				proc_id.y = translate_reverse[x].y;
				if(x==0)
					break;					
				end
			else			
				break;
			end
		end
		
	frame(speed_percent);
	end
endprocess