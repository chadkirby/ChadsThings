$fs = 1;
$fa = 6;

module _ry() {
    rotate([90,0]) children();
}
module _rx() {
    rotate([0,90]) children();
}

module cartridge(inflate=0, h=75) {
  cylinder(d=24+inflate, h=h, center=true);
}
module halfCartridge(inflate=0, h=75) {
  intersection() {
    cartridge(inflate, h);
    translate([-50,0,0]) cube(size=[100, 100, 100], center=true);
  }
}
module seatpost(inflate=0, h=1000) {
  intersection() {
    cylinder(d=29.2+inflate, h=h, center=true);
    translate([50,0,0]) cube(size=[100, 100, 100], center=true);
  }
}

module strap(inflate=0, h=27) {
  d=55+inflate;
  translate([20,0,0]) difference() {
    cylinder(d=d, h=h, center=true);
    cylinder(d=d-6, h=100, center=true);
  }
}

module rot(direction=1) {
  rotate([0,0,25 * direction]) translate([32, 0, 0]) children();
}

hgt = 37;
translate([0,0,hgt/2]) difference() {
  hull() {
    seatpost(inflate=12, h=hgt);
    rot() halfCartridge(inflate=10, h=hgt);
    rot(-1) halfCartridge(inflate=10, h=hgt);
    intersection() {
      strap(3, hgt);
      translate([21/2,0,0]) cube(size=[21, 100, 100], center=true);
    }
  }
  strap();
  seatpost();
  rot() cartridge(inflate=0);
  rot(-1) cartridge(inflate=0);
}

translate([-45, 0, 10/2]) {
  difference() {
    hull() {
      rot() cylinder(d=15, h=10, center=true);
      rot(-1) cylinder(d=15, h=10, center=true);
    }
    rot() cylinder(d=9.4, h=100, center=true);
    rot(-1) cylinder(d=9.4, h=100, center=true);
  }
}
