process AnimateHit()
private
	int oldLife;
	int hitGraph, originGraph;
	int stopLoop;
	int bo_tint;
begin
	originGraph = father.graph;	
	hitGraph = map_clone(father.file, father.graph);
	
	bo_tint = blendop_new();
	// blendop_tint(bo_tint, 0.8, 255, 50, 50);
	blendop_tint(bo_tint, 0.8, 255, 0, 0);
	blendop_apply(0, hitGraph, bo_tint);
	
	// rgbscale(0, hitGraph, 100, 100, 1000);
	// grayscale(0, hitGraph, GSCALE_RG);
	
	while(exists(father))	
		oldLife = father.Life;
	frame(400);
		if(exists(father))
			if(oldLife != father.Life && father.Life != 100)
				father.graph = hitGraph;
				stopLoop = true;
			else
				if(stopLoop)
					father.graph = originGraph;
					stopLoop = false;
				end
			end
		end
	end
	
endprocess

// process AnimateHit()
// private
	// int oldLife;
	// int bo_tint;
	// int hitGraph, originGraph;
	// int stopLoop;
// begin
	// originGraph = father.graph;	
	// bo_tint = blendop_new();
	// blendop_tint(bo_tint, 0.5, 255, 0, 0);
	// hitGraph = new_map(map_info(father.file, father.graph, G_WIDTH), map_info(father.file, father.graph, G_HEIGHT),16);
	// map_put(0, hitGraph, father.graph, map_info(0, hitGraph, G_WIDTH) / 2, map_info(0, hitGraph, G_HEIGHT) / 2);
	// while(exists(father))	
		// oldLife = father.Life;
	// frame(400);
		// if(exists(father))
			// if(oldLife != father.Life && father.Life != 100)
				// say("Origine Graph Avant = " + originGraph);
				// //hitGraph = map_clone(father.file, originGraph);
				// father.graph = hitGraph;
				// blendop_assign(0, hitGraph, bo_tint);
				// stopLoop = true;
			// else
				// if(stopLoop)
					// father.graph = originGraph;
					// say("Origine Graph Apres = father.graph " + father.graph);
					// blendop_assign(file, hitGraph, NULL);
					// map_unload(father.file, hitGraph);
					// //blendop_free(bo_tint);
					// stopLoop = false;
				// end
			// end
		// end
	// end
	
// endprocess