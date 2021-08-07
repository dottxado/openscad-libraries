use <regular_polygon.scad>

/*
 * Use this module to generate the logo.
 *
 * max_dimension The vertical dimension of the logo
 * thickness The thickness of the logo lines (it has 2 values, the second is 1.5 of this)
 * height The maximum height of the logo (it has 2 values, the second is half of this)
 * x_shift It isn't necessary to modify it
 * y_shift It isn't necessary to modify it. Pass a negative value to flip the design when using it upside down
 *
 */
module tetracube_logo(max_dimension = 20, thickness = 0.5, height = 2, x_shift = 3, y_shift = 4) {
	diagonal = x_shift / (x_shift * 2 + 1) * max_dimension;
	rotate([0, 0, 90]) {
		translate([(diagonal / x_shift) / 2, - (diagonal / y_shift) / 2, 0]) {
			linear_extrude(height) {
				logo_base_hexagon(diagonal, thickness);
			}


			linear_extrude(height / 2) {
				translate([-1/x_shift * diagonal, 1/y_shift * diagonal, 0]) {
					difference() {
						logo_base_hexagon(diagonal, thickness * 1.5);
						logo_dashes(thickness/2, diagonal * 2, thickness);
					}
					
				}
			}
		}
	}	
}

module logo_base_hexagon(diagonal, thickness) {
	difference() {
			regular_polygon(6, diagonal);
			regular_polygon(6, diagonal - thickness);
		}
		for(i = [0:120:360]) {
			rotate([0, 0, i]) {
				translate([(diagonal - thickness)/2, 0, 0]) {
					square([diagonal - thickness, thickness], true);
				}
			}
		}
}

module logo_dashes(thickness, length, gutter) {
	step = thickness + gutter;
	rotate([0,0,35]) {
		translate([0, length/2, 0]) {
			for(i = [0:step:length]) {
				translate([0, -i, 0]) {
					square([length, thickness], true);
				}
			}
		}
	}
	
}