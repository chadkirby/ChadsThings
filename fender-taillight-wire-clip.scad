$fn = 15;

module wire(args) {
  hull() {
    translate([1,0,0]) cylinder(d=2, h=100, center=true);
    translate([-1,0,0]) cylinder(d=2, h=100, center=true);
  }
}

difference() {
  hull() {
    cylinder(d=8, h=10, center=true, $fn=20);
    translate([0, 4]) cylinder(d=7, h=10, center=true, $fn=20);
  }
  translate([0, 2]) hull() {
    translate([0, -3]) wire();
    translate([0, 3]) wire();
  }
  #translate([0, 8.5]) hull() {
    translate([0, -3]) cylinder(d=2, h=100, center=true);
    translate([0, 1]) cylinder(d=6, h=100, center=true);
  }
}
