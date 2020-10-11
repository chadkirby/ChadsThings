$fs = 1;
$fa = 6;

difference() {
  for (zz=[-3, 3]) {
    _rx() translate([0,0,zz]) cylinder(d=16, h=2.75, center=true);
    translate([zz, 0, -15/2]) cube([2.75, 16, 15], center=true);
    hull() {
      translate([zz, 0, -15/2 - 4]) cube([2.75, 16, 13], center=true);
      translate([sign(zz) * 8, 0, -15]) _ry() cylinder(d=9, h=16, center=true);
    }

  }

  _rx() cylinder(d=5.5, h=100, center=true);

  _rx() difference() {
    cylinder(d=18, h=100, center=true);
    cylinder(d=18, h=9, center=true);
  }

  for (xx=[-8, 8]) {
    translate([xx, 0, -15]) _ry() cylinder(d=5, h=100, center=true);
  }

}

module _ry() {
    rotate([90,0]) children();
}
module _rx() {
    rotate([0,90]) children();
}
