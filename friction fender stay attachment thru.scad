stayAngle = asin((150 - 60)/355); // rear
//stayAngle = 0; // front*/
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
module stayThru() {
    translate([0,2.5,0]) rotate([stayAngle,0,0]) translate([0, 0, -4]) cylinder(d=stayD, h=len+5, center=false, $fn=12);
}
module shank(len) {
    translate([0,2.5,0]) rotate([stayAngle,0,0]) {
        rotate([0,0,180/8]) cylinder(d1=wid, d2=(stayD + 3), h=len, center=false);

    }
}

rotate([90 - stayAngle/2,0,0])
    difference() {
        union() {
            shank(len);

            translate([0,2,-2]) {
                difference() {
                    hull() {
                        translate([0,-2,2]) shank(10);
                        translate([0,-wid/4,-wid/2]) rotate([90,0,0]) cylinder(d=wid+4, h=wid/2, center=true);
                    }
                    translate([0,-wid/4,-wid/2]) rotate([90,0,0]) {
                        cylinder(d=6, h=25, center=true);
                        rotate([0,180,0]) cylinder(d=11, h=wid, center=false);
                    }
                }
            }
        }
        stayThru();
    }
