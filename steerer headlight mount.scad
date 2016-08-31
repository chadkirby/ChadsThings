spacerD = 36.4;
protrudeLen = 6;
thick = 4;
height = 20;
rodD = 4.9;
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
        hull() {
            cylinder(d=spacerD + 2*thick, h=height, center=true);
            for (xoff=[-rodSpacing/2:rodSpacing:rodSpacing/2]) {
                translate([xoff, spacerD/2 + protrudeLen, -5]) rotate([10,0,0]) cylinder(d=rodD + 2*thick, h=height+3, center=true);
            }
        }
        // set screw
        translate([0, spacerD/2])
        #_ry() cylinder(d= 0.136 * 25.4, h=spacerD, center=true);
        cylinder(d=spacerD, h=100, center=true);
        for (xoff=[-rodSpacing/2:rodSpacing:rodSpacing/2]) {
            translate([xoff, spacerD/2 + protrudeLen, 0]) rotate([10,0,0]) cylinder(d=rodD, h=100, center=true);
        }

    }
    cylinder(r=100, h=height, center=true);
}
