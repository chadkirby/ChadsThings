$fs = 1;
$fa = 6;

module rod(args) {
  translate([0, 27, 0])
  _rx() cylinder(d=33, h=100, center=true);
}

difference() {
  hull() {
    translate([0, 25, 0]) _rx() cylinder(d=50, h=15, center=true);
    translate([0, 1/2, -70/2]) cube(size=[15, 1, 70], center=true);
  }
  rod();
  translate([0, 0, -30]) screw();
  translate([0, 0, -55]) screw();
  _ry() cylinder(d=4, h=1000, center=true);
}

module screw(args) {
  _ry() {
    translate([0, 0, -7.45]) rotate([180, 0, 0]) cylinder(d=10, h=100, center=false);
    translate([0, 0, -7.5]) cylinder(d1=10, d2=4, h=4, center=false);
    cylinder(d=4, h=100, center=true);
  }
}

module _ry() {
    rotate([90,0]) children();
}
module _rx() {
    rotate([0,90]) children();
}
