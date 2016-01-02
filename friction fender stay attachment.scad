stayAngle = asin(40/(11*25.4)); // rear
// stayAngle = 0; // front

len = 20;
wid = 10;
offset = -tan(stayAngle) * len;
smoffset = sin(stayAngle) * wid;
module squaredCircle(len, rot=[0,0,0], $fn=12) {
    hull() {
        rotate(rot) cylinder(d=wid/cos(180/$fn), h=len, center=false, $fn=$fn);
    }
}
intersection() {

    union() {
        rotate([stayAngle,0,0]) difference() {
            hull() {
                rotate([0,0,180/8]) cylinder(d=wid/cos(180/8), h=len, center=false, $fn=8);
                rotate([-stayAngle,0,0]) translate([0, offset, 1-smoffset/2]) rotate([0,0,180/8]) cylinder(d=wid/cos(180/8), h=len-1, center=false, $fn=8);
            }
            cylinder(d=4.7, h=len+1, center=false, $fn=12);
        }


        translate([0,0,-2]) {
            difference() {
                hull() {
                    translate([0,0,2]) rotate([stayAngle,0,0]) squaredCircle(1, [0,0,180/8], 8);
                    translate([0,-wid/4,-wid/2]) rotate([90,0,0]) cylinder(d=wid+4, h=wid/2, center=true);
                }
                translate([0,-wid/4,-wid/2]) rotate([90,0,0]) {
                    cylinder(d=6, h=25, center=true);
                    rotate([0,180,0]) cylinder(d=11, h=wid, center=false);
                }
            }
        }
    }
    translate([-50,-wid/2+offset+0.3,-50]) cube(size=[100, wid -offset, 100], center=false);
}
