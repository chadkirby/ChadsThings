len = 14;
braceD = 13;
$fs = 1;

rake = 1.25;
forkLen = 14;
rakeOffsetAngle = 0 * (90 - atan(forkLen/rake));

module brace() {
    rotate([90,0,0]) cylinder(d=braceD, h=50, center=true);
    cylinder(d=9, h=braceD + 4, center=true);
    cylinder(d=6, h=100, center=true);
}
rotate([0, -rakeOffsetAngle, 0]) difference() {
    rotate([0, rakeOffsetAngle, 0]) translate([0,0,-(len + braceD/2)]) {
        cylinder(d1=18, d2=20, h=1, center=false);
        translate([0,0,1]) cylinder(d1=20, d2=braceD, h=len+1, center=false);

        }
    #brace();
}

// washer
*difference() {
    translate([0,0,-28]) intersection() {
        translate([0,0,-1]) rotate([0, rakeOffsetAngle, 0]) cylinder(d=25, h=5, center=true);
        cylinder(d=25, h=3, center=false);

    }
    brace();
}
