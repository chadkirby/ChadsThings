use <BezierScad.scad>
$fn = 36;

len = 65;
pumpD = 23.25;
insertD = 10;
insertOffset = 38;
wid = 15;
hgt = 10;

rotate([90,0,0]) difference() {
	base();
	screwCutout(insertOffset/2);
	screwCutout(-insertOffset/2);
	translate([0,0,hgt+(pumpD/2)]) rotate([90,0,0]) cylinder(r=pumpD/2, h=len+2, center=true);
}

module base() {
	difference() {
		union() {
			rotate([90,0,0]) 
				linear_extrude(len, center=true) polygon(
					points=[
					[-insertD/2-4, 0],
					[insertD/2+4, 0],
					[pumpD/2, hgt+4],
					[-pumpD/2, hgt+4],
					]
				);
			translate([0,0,hgt+(pumpD/2)]) rotate([90,0,0]) cylinder(r=2.5+pumpD/2, h=len, center=true);
		}
	translate([0,0,14+hgt+(pumpD/2)]) rotate([90,0,0]) rotate([0,0,360/12]) cylinder(r=5+pumpD/2, h=len+1, center=true, $fn=6);
	rotate([90,0,90]) linear_extrude(pumpD*2, center=true) polygon(points=[
		[-len/2 + pumpD,hgt+2],
		[len/2 - pumpD,hgt+2],
		[len/2, hgt+pumpD],
		[-len/2, hgt+pumpD],
	]);
	translate([0,0,hgt+1.5+pumpD/2])
		rotate([90,0,0]) {
			difference() {
				cylinder(r=6+pumpD/2, h=24, center=true);
				cylinder(r=3.5+pumpD/2, h=25, center=true);
			} 
		}
	translate([0,0,-50 + 1]) rotate([90,0,0]) cylinder(r=50, h = len+2, center=true, $fn=360);
	}
}

module screwCutout(yOffset) {
	translate([0,yOffset,0]) {
		translate([0,0,hgt/2]) cylinder(r=5/2, h=hgt+2, center=true);
		translate([0,0,-0.1]) cylinder(r=(insertD/2)/cos(180/8), h=2, center=false, $fn=8);
		translate([0,0,6]) cylinder(r=(10/2)/cos(180/8), h=10, center=false, $fn=8);
	}
}

