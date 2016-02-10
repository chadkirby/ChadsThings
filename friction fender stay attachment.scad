stayAngle = asin((150 - 60)/355); // rear
// stayAngle = 0; // front
$fs = 1;
$fa = 6;

len = 30;
wid = 10;
stayD = 4.7;
stayD = 25.4/4;
offset = -tan(stayAngle) * len;
smoffset = sin(stayAngle) * wid;
module squaredCircle(len, rot=[0,0,0], $fn=12) {
    hull() {
        rotate(rot) cylinder(d=wid/cos(180/$fn), h=len, center=false, $fn=$fn);
    }
}
rotate([90,0,0]) intersection() {

    union() {
        difference() {
            rotate([stayAngle,0,0]) difference() {
                rotate([0,0,180/8]) cylinder(d1=wid, d2=(stayD + 3), h=len, center=false);
                translate([0, 0, 9]) cylinder(d=stayD, h=len+1, center=false, $fn=12);

            }
            translate([0,-wid/4 - 5,-(wid+4)/2]) rotate([90]) cylinder(d=wid+4, h=10, center=true);

        }


        translate([0,2,-2]) {
            difference() {
                hull() {
                    translate([0,-2,2]) rotate([stayAngle,0,0]) cylinder(d=wid, h=1, center=false);;
                    translate([0,-wid/4,-wid/2]) rotate([90,0,0]) cylinder(d=wid+4, h=wid/2, center=true);
                }
                translate([0,-wid/4,-wid/2]) rotate([90,0,0]) {
                    cylinder(d=6, h=25, center=true);
                    rotate([0,180,0]) cylinder(d=11, h=wid, center=false);
                }
                translate([0,-wid/4 - 7,-wid/2]) rotate([90]) cylinder(d=wid+4, h=10, center=true);
            }
        }
    }
    translate([-50,-wid/2+offset+0.3,-50]) cube(size=[100, wid -offset, 100], center=false);
}
