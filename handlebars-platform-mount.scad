$fs = 1;
$fa = 6;

translate([15, 0]) difference() {
  hull() {
    _rx() cylinder(d=13.5, h=13.5, center=true);
    cylinder(d=13.5, h=20, center=false);
  }
  _rx() cylinder(d=8, h=100, center=true);
  cylinder(d=9.5, h=100, center=false);
}

translate([-15, 0]) difference() {
  hull() {
    _rx() cylinder(d=17, h=13.5, center=true);
    cylinder(d=13.5, h=20, center=false);
  }
  _rx() cylinder(d=12.7, h=100, center=true);
  cylinder(d=9.5, h=100, center=false);
}

module _ry() {
    rotate([90,0]) children();
}
module _rx() {
    rotate([0,90]) children();
}
