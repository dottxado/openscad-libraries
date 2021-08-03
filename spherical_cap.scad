/* Draw a spherical cap knowing:
 *
 * - the diameter of the cap (that's the cord lenght of the sphere)
 * - the height of the cap
 * - the thickness of the sphere
 *
 */
module spherical_cap(diameter, cap_height, sphere_thickness) {
	max_radius = cap_height/2 + pow(diameter, 2)/(8 * cap_height);
	teta_cord = 2 * asin(diameter/(2 * max_radius));
	alfa = (180 - teta_cord)/ 2;
	min_radius = (cap_height - sphere_thickness * cos(alfa))/2 + pow(diameter - (sphere_thickness  * 2), 2)/(8 * (cap_height - sphere_thickness * cos(alfa)));
	translate([0, 0, cap_height - max_radius]) {
		difference() {
			sphere(max_radius);
			sphere(min_radius);
			translate([0, 0, - cap_height]) {
				cube(max_radius * 2, true);
			}
		}
	}
}