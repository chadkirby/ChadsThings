// -1 is left side
direction = -1; // 1, 0, or -1
/*stayAngle = direction * asin(55/(13*25.4)); // rear*/
stayAngle = direction * asin(30/(13*25.4)); // rear
stayAngle = 0; // front

thick = 2;
stayD = 5.2;
boltD = 6.2;
boltHeadD = 11;
tall = 12;
post = 6;

module bolt() {
    cylinder(d=boltD, h=20, center=false);
    rotate([180,0,0]) cylinder(d=boltHeadD, h=10, center=false);
}

module hex(d, h, center) {
     cylinder(d=d/cos(180/8), $fn=8, h=h, center=center);
}
outerD = boltHeadD + 2*thick;
offset = tan(stayAngle) * outerD;
smoffset = sin(stayAngle) * outerD;
echo(str("Variable = ", smoffset, offset));
intersection() {
    rotate([90,0,0]) difference() {
        hull() {
            translate([0,0, post/2]) rotate([0,0,22.5]) hex(d=outerD, h=tall + post, center=true);
            translate([outerD/2 + thick,0,smoffset/2]) rotate([90 - stayAngle,0,0]) cylinder(d=tall, h=boltHeadD + 2*thick + 2, center=true);
        }
        rotate([direction == 1 ? 180 : 0,0,0]) translate([0,0,-(thick+2)]) bolt();
        translate([outerD/2 + thick,0,smoffset/2]) rotate([90 - stayAngle,0,0]) cylinder(d=stayD, h=100, center=true);
        hull() {
            translate([outerD/2,0,smoffset/2]) rotate([90 - stayAngle,0,0]) cylinder(d=1.5, h=outerD+4, center=true);
            rotate([90,0,0]) cylinder(d=1.5, h=outerD+1, center=true);
        }
        hull() {
            rotate([90,0,0]) cylinder(d=1.5, h=outerD+4, center=true);
            translate([-outerD,0,0]) rotate([90,0,0]) cylinder(d=1.5, h=outerD+1, center=true);
        }
    }
    cube([100, 100, outerD], center=true);
}
