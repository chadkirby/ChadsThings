$fs = 1;
$fa = 6;

module zip(d) {
  difference() {
    cylinder(d=d+2.5, h=7, center=true);
    cylinder(d=d-2.5, h=100, center=true);
  }
}

difference() {
  hull() {
    translate([125,0,0]) cylinder(d=30, h=15, center=true);
    cylinder(d=18, h=15, center=true);
  }
  translate([125,0,0]) cylinder(d=32, h=100, center=true);
  cylinder(d=19, h=100, center=true);

  zip(27);
  translate([125,0,0]) zip(40);
}
