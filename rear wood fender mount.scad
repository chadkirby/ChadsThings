use <friction fender stay attachment thru.scad>
$fs = 1;
$fa = 6;

fenderWidth = 53;
fenderThick = 5.5;
stayD = 25.4/4;
stayAngle = asin(0.5*(165 - 60)/330); // rear
// stayAngle = 0; // front
module fenderStay(dir=1) {
    #translate([0,8,0]) {
        rotate([90,0,stayAngle*dir]) cylinder(d=5, h=13*25.4, center=false);
    }
}
module rotStay(ii) {
    rotate([90, ii * -90]) children();
}
module stay(len = 25, ii = 1) {
    moveToStay(ii) shank(len, stayAngle = stayAngle);
}
module moveToStay(ii) {
    translate([ii*(fenderWidth/2+8.5),0,0]) rotStay(ii) children();
}

rotate([0,0,0]) difference() {
    union() {
        difference() {
            hull() {
                translate([0, -1]) cube([fenderWidth+2, fenderThick+6, 12], center=true);
                #for (ii=[-1, 1]) {
                    stay(ii = ii, len = 15);
                }
            }
            hull() {
                for (xx=[-fenderWidth/2 + 10, fenderWidth/2 - 10]) {
                    translate([xx, -fenderThick - 16])
                    cylinder(r=15, h=100, center=true);

                }
            }
        }
        for (ii=[-1, 1]) {
            stay(ii = ii);
        }
    }
    for (ii=[-1:2:1]) {
        moveToStay(ii) stayThru(l=100, center=true, stayAngle = stayAngle);
    }

    // fender
    cube([fenderWidth, fenderThick, 25], center=true);
    // screws
    for (xx=[-12.7, 12.7]) {
        translate([xx,fenderThick/2 + 2.1,0]) rotate([-90,0,0]) cylinder(d=9.8, h=6, center=false);
        translate([xx, 0, 0]) {
            rotate([90,0,0]) cylinder(d=3.4, h=25, center=false, $fn=12);
            rotate([-90,0,0]) cylinder(d=4.6, h=25, center=false, $fn=12);
        }
    }
    #translate([0,-32,0]) cylinder(d=42, h=10, center=true);
}
offset=12;
