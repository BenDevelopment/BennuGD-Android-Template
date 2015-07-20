type point;
    int x;
    int y;
end


type enemy
	point position;
	int gold;
	int actual_life;
	int initial_life;
	int enemy_type;
	int proc_id;
	int tile_index;
end

type content;
    int type_content;
	treasure treasure_definition;
	enemy enemy_definition;
end

type rect
	int x0, x1, y0, y1;
end

type tile
	int tile_index;
	point position;
	int file_id;
	int graph_id;
	int proc_id;
	content content_definition;
end
