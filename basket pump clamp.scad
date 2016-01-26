use <BezierScad.scad>
use <../3d-bike-basket/basket.scad>
$fs = 1;
$fa = 6;

module _ry() {
    rotate([90,0]) children();
}
module _rx() {
    rotate([0,90]) children();
}
module wedge(d, h, center, arc) {
    hull() {
        cylinder(d=0.1, h=h, center=center);
        rotate([0,0,arc/2]) translate([0, d*2]) cylinder(d=0.1, h=h, center=center);
        rotate([0,0,-arc/2]) translate([0, d*2]) cylinder(d=0.1, h=h, center=center);
        translate([0, d*2]) cylinder(d=0.1, h=h, center=center);
    }
}

module _arcOfCyl(d, h, center=true, arc=90) {
    if (arc > 180) {
        difference() {
            cylinder(d=d, h=h, center=center);
            wedge(d=d, h=h + 1, center=center, arc=360 - arc);
        }
    } else {
        intersection() {
            cylinder(d=d, h=h, center=center);
            wedge(d=d, h=h + 1, center=center, arc=arc);
        }
    }
}

len = 32;
pumpD = 23.25;
insertD = 35;
insertOffset = 38;
wid = 15;
hgt = 3;

rotate([90,-5]) intersection() {
    base();
    translate([0,-4]) rotate([0,0,5]) cube(size=[100, len, 100], center=true);
    translate([0,4]) rotate([0,0,-5]) cube(size=[100, len, 100], center=true);
}
zipD = 33;
module zip(args) {
    rotate([90,0,0]) difference() {
        cylinder(d=zipD, h=4, center=true);
        cylinder(d=zipD-4, h=4, center=true);
    }
}
module moveToPump(args) {
	translate([pumpD + 10,0,hgt+(pumpD/2)]) children();
}
module base() {
	difference() {
		union() {
			hull() {
                translate([insertD/2 - 2, 0, hgt/2]) _ry() cylinder(d=hgt, h=len, center=true);
                translate([-insertD/2, 0, hgt/2]) _ry() cylinder(d=hgt, h=len, center=true);

				moveToPump() _ry() cylinder(d=5, h=len, center=true);
			}
			moveToPump() _ry() rotate([0,0,-45]) _arcOfCyl(arc = 235, d=5+pumpD, h=len, center=true);
		}
		// velcro tie
		moveToPump() _ry() {
			difference() {
				cylinder(r=6+pumpD/2, h=20, center=true);
				cylinder(r=3.5+pumpD/2, h=25, center=true);
			}
		}
		for (ii=[-1:2:1]) {
			translate([ii*12.5,0,0]) {
				cylinder(d=5, h=100, center=true);
				translate([0,0,3]) cylinder(d=8.75, h=100, center=false);
			}
		}

		moveToPump() _ry() cylinder(r=pumpD/2, h=len+2, center=true);
	}
}

module screwCutout(yOffset) {
	translate([0,yOffset,0]) {
		translate([0,0,hgt/2]) cylinder(r=5/2, h=hgt+2, center=true);
		translate([0,0,-0.1]) cylinder(r=(insertD/2)/cos(180/8), h=2, center=false, $fn=8);
		translate([0,0,6]) cylinder(r=(10/2)/cos(180/8), h=10, center=false, $fn=8);
	}
}
