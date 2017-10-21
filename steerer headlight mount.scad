spacerD = 36.4;
protrudeLen = 7;
thick = 4;
height = 20;
rodD = 4.5;
rodSpacing = 10.6 + rodD;

module _ry() {
    rotate([90,0]) children();
}
module _rx() {
    rotate([0,90]) children();
}

$fs=1.5;
intersection() {
    difference() {
        union() {
            cylinder(d=spacerD + 2*thick, h=height, center=true);
            translate([0, 0, -4]) rotate([10,0,0]) hull() {
                for (xoff=[-rodSpacing/2:rodSpacing:rodSpacing/2]) {
                 translate([xoff, spacerD/2 + protrudeLen, 1]) cylinder(d=rodD + 2*thick, h=height, center=true);
                }
                translate([0,0,1]) difference() {
                    cylinder(d=spacerD + 2*thick, h=height, center=true);
                    translate([-50, -100, -50]) cube(size=[100, 100, 100], center=false);
                }
            }
        }
        // set screw
        translate([0, spacerD/2])
        #_ry() cylinder(d= 0.15 * 25.4, h=spacerD, center=true);
        cylinder(d=spacerD, h=100, center=true);
        for (xoff=[-rodSpacing/2:rodSpacing:rodSpacing/2]) {
            translate([xoff, spacerD/2 + protrudeLen, 0]) rotate([10,0,0]) cylinder(d=rodD, h=100, center=true);
        }
        translate([0,0,-height])cylinder(r=100, h=height, center=true);

    }
    *cylinder(r=100, h=height, center=true);
}
