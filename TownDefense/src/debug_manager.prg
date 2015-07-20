global
	int debugs_count;

function write_debug(string* debug_string)
begin
	if(count_instance(type background_debug) == 0)
		//background_debug();
	end
	write_string(0,0,debugs_count*10,0,debug_string);
	debugs_count++;
endfunction

process background_debug()
private
	int background_draw_box;
begin
	loop	
	
		drawing_alpha(80);
		drawing_color(rgb(10,10,10));
		drawing_z(99);
		background_draw_box = draw_box(0,0,screen_size.x, debugs_count*10);
	frame;
		delete_draw(background_draw_box);
	end
endprocess