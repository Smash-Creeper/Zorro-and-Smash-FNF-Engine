var proc = 0
repeat(playerchartcount){
	draw_grid(room_width/2 + (grid_size * notecount)*proc, grid_y,grid_size,grid_size,notecount,16,grid_color1,grid_color2)
	proc += 1
}
var proc = 0
repeat(cpuchartcount){
	draw_grid(room_width/2+ (grid_size * notecount)*(-proc-1), grid_y,grid_size,grid_size,notecount,16,grid_color1,grid_color2)
	proc += 1
}
	
