difference() {
    union() {
        cube([15, 60, 3]);
        translate([-60,30,0]) cube([75, 15, 3]);
        translate([-35,0,0]) cube([50, 30, 3]);
    }
    translate([-10,20,0]) cylinder(d=4, h=10, center=true);
}
