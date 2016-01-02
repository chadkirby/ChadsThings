nippleSlot = 1.0;
spokeD = 1.5;
desiredSpokeOffset = 2.5;
spokeExcessLength = -0.1;

module blade() {
    translate([0,0,0.75]) cube([6, nippleSlot, 1.5], center=true);
    translate([0,0,-8.5 + (desiredSpokeOffset - spokeExcessLength)])
        cylinder(d=spokeD, h=10, center=false, $fn=8);
}

module shaft() {
    cylinder(d1=10, d2=15, h=5, center=false);
    translate([0,0,5]) cylinder(d=15, h=10, center=false);
    translate([0,0,15]) cylinder(d1=15, d2=6, h=5, center=false);
    translate([0,0,5]) {
        rotate([0,0,180/12]) cylinder(d=6/cos(180/12), h=25, center=false, $fn=12);
        translate([0,0,25]) hull() {
            rotate([0,0,180/12]) cylinder(d=6/cos(180/12), h=1, center=false, $fn=12);
            translate([-3,-nippleSlot/2,0]) cube([6, nippleSlot, 5], center=false);
        }
        translate([0, 0, 30]) blade();
    }
}

shaft();
