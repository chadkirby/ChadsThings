$fs = 1;
$fa = 6;
rake = 65;
forkLen = 325;
rakeOffsetAngle = 1 * (90 - atan(forkLen/rake));

forkHoleD = 22;
big = 100;
module boltCutouts() {
    translate([-2, 0, 5]) rotate([0, -rakeOffsetAngle, 0]) {
        cylinder(d=8.25/cos(180/6), $fn=6, h=25, center=true); // aluminum insert
        cylinder(d=6, h=100, center=true); // fender bolt hole
    }
}
module forkInsert() {
    difference() {
        translate([0,0,-10])
            cylinder(d=forkHoleD, h=16, center=false);
        boltCutouts();
        rotate([0,90,0])
            cylinder(d=6, h=big, center=true); // fork crown bolt hole
    }
}
translate([30, 0, -6]) forkInsert();
module forkMount(args) {
    rotate([0, 1*rakeOffsetAngle, 0]) difference() {
        union () {
            translate([0,0,-20])
                cylinder(d=forkHoleD, h=25, center=false);
            translate([0,0,-19.5])
                cylinder(d=30, h=7, center=false);
        }
        scale([1.01, 1.01, 18/16]) hull() forkInsert();
        boltCutouts();
        // make a cube whose top surface is parallel to the bottom of the fork crown
        // then rotate it so that the top surface is tangent to the fender circle
        // that gives us a flat (printable) bottom suface for the mount
        rotate([0, -rakeOffsetAngle, 0])
            translate([0, 0, -forkLen - 16])
                cube([2*forkLen, 60, 2*forkLen], center=true);

        // sanity check: show the fender circle based on translation to make
        // sure our rotation is correct
        //translate([rake, 0, -forkLen]) rotate([90,0,0]) cylinder(d=(584 + 46)/cos(180/90), h=60, center=true, $fn=90);
    }
}

module washer(args) {
    offset = sin(rakeOffsetAngle) * forkHoleD;
    rotate([0, -1*rakeOffsetAngle, 0])
        intersection() {
            translate([0, 0, offset/2])
                rotate([0, 1*rakeOffsetAngle, 0])
                    difference() {
                        cylinder(d=forkHoleD, h=30, center=false);
                        cylinder(d=6, h=big, center=true); // bolt hole
                    }
            cylinder(r=big, h=offset, center=false);
        }
}
*rotate([0, -rakeOffsetAngle, 0]) {
    translate([0,0,16]) forkMount();
    translate([-4,0,-8]) rotate([0, 1*rakeOffsetAngle, 0]) washer();
}
forkMount();
*washer();
