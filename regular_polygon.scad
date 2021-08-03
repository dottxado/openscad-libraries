/*
 * Draw a regular polygon
 */
module regular_polygon(number_of_points = 4, diagonal = 20) {
	step = 360/number_of_points;
	points = [ for(i = [0:step:360]) [diagonal*cos(i), diagonal*sin(i)] ];
	polygon(points);
}

/*
 * Draw a matrix of hexagons giving:
 *
 * - the diagonal of the hexagon
 * - the space between the hexagons
 * - the width of the matrix
 * - the height of the matrix
 *
 */
module hexagon_matrix_rectangular( diagonal = 10, gutter = 1, width = 100, height = 100) {
	number_of_points = 6;
	angle = 360/number_of_points;
	
	spacer_x = (diagonal * cos(angle/2) * 2 + gutter) * sin(angle) * 2 ;
	spacer_y = (diagonal * cos(angle/2)) + gutter / 2;
	
	for(j = [0:spacer_y:height]) {
		for(i = [0:spacer_x:width]){
			x_translation = i + ((round((j/spacer_y / 2)) == (round(j/spacer_y)/ 2)) ? 0 : spacer_x/2) ;
			translate([x_translation, j, 0])
			regular_polygon(number_of_points = number_of_points, diagonal = diagonal);
		}
	}
}

/*
 * Draw a matrix of hexagons that spans in diagonal giving:
 *
 * - the diagonal of the hexagon
 * - the space between the hexagons
 * - the width of the matrix
 * - the height of the matrix
 *
 */
module hexagon_matrix_diagonal( diagonal = 10, gutter = 1, width = 100, height = 100) {
	number_of_points = 6;
	angle = 360/number_of_points;
	
	spacer_x = (diagonal * cos(angle/2) * 2 + gutter) * sin(angle) * 2 ;
	spacer_y = (diagonal * cos(angle/2)) + gutter / 2;
	
	for(j = [0:spacer_y:height]) {
		for(i = [0:spacer_x:width]){
			x_translation = i + j/spacer_y * spacer_x/2;
			translate([x_translation, j, 0])
			regular_polygon(number_of_points = number_of_points, diagonal = diagonal);
		}
	}
}


