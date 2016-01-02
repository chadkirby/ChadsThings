module nipple(d=3.3) {
    cylinder(d=d/cos(180/4), $fn=4, h=8, center=false);
    translate([0,0,-0.1]) cylinder(d2=d/cos(180/4), d1=(d+0.5)/cos(180/4), $fn=4, h=1, center=false);
    translate([0,0,7.1]) cylinder(d1=d/cos(180/4), d2=(d+0.5)/cos(180/4), $fn=4, h=1, center=false);

}

module spoke(d=2.5) {
    cylinder(d=d/cos(180/8), h=200, center=false, $fn=8);
}

rotate([0,0,0]) difference() {
    union() {
        rotate([0,-90,0]) {
            rotate([0,90,0]) cylinder(d=12.1, h=6, center=false);
            hull() {
                rotate([0,90,0]) translate([0,0,6]) cylinder(d=12.1, h=0.1, center=false);
                translate([25,0,2]) {
                    translate([0,12.5,0]) cylinder(d=12.5, h=5, center=true);
                    translate([0,-12.5,0]) cylinder(d=12.5, h=5, center=true);
                }
                *translate([21,0,1]) {
                    cylinder(d=35, h=1, center=false);
                    translate([0,0,1]) cylinder(d=37, h=3, center=false);
                    translate([0,0,4]) cylinder(d=35, h=1, center=false);
                }
            }
        }
    }
    rotate([0,0,45]) nipple(3.8);
    hull() {
        translate([4,0,-0.10]) spoke();
        spoke();
    }
    hull() {
        translate([4,0,-0.10]) spoke();
        translate([7.5,0,-0.10]) scale([2,2,1]) spoke();
    }

}
!rotate([0,0,0]) difference() {
    union() {
            hull() {
                cylinder(d=12.5, h=8, center=false);
                translate([0,10,0]) {
                    cylinder(d=12.5, h=8, center=false);
                    }
                translate([4,0,0]) {
                    cylinder(d=12, h=8, center=false);
                    }
                translate([0,-10,0]) {
                    cylinder(d=12.5, h=8, center=false);
                    }
                }
            }
                translate([0,9.5,0]) {
                    rotate([-5,0,0]) cylinder(d=6.25, h=20, center=true);
                    }
                translate([0,-9.5,0]) {
                    rotate([5,0,0]) cylinder(d=6.25, h=20, center=true);
                    }
    rotate([0,0,45]) nipple(3.8);
    hull() {
        translate([-4,0,-0.10]) spoke();
        spoke();
    }
    hull() {
        translate([-4,0,-0.10]) spoke();
        translate([-10,0,-0.10]) scale([2,2,1]) spoke();
    }

}
