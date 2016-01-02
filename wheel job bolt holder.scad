module bolt(d) {
    cylinder(d=d/cos(180/6), h=6, center=false, $fn=6);
    cylinder(d=8, h=50, center=false);
}

rotate([0,180,0]) difference() {
    hull() {
        cylinder(d=20, h=6, center=false);
        translate([0,63,0]) cylinder(d=20, h=6, center=false);
    }
    translate([0,0,-1]) {
        bolt(11.7);
        translate([0,63,0]) bolt(11.7);
    }
}
