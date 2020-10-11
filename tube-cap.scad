$fs = 1;
$fa = 6;

  hull() {
    translate([0, 0, 3]) cube(size=[26, 26, 1], center=true);
    cube(size=[20, 20, 3], center=true);
  }
translate([0, 0, 6]) {
  difference() {
    union() {
      cube(size=[22.4, 22.4, 6], center=true);
      for (yy=[-10:5:10]) {
        translate([0, yy, -3.5]) hull() {
          cube(size=[23, 1, 1], center=true);
          translate([0, 0, 6]) cube(size=[22.4, 1, 1], center=true);
        }
      }
      for (xx=[-10:5:10]) {
        translate([xx, 0, -3.5]) hull() {
          cube(size=[1, 23, 1], center=true);
          translate([0, 0, 6]) cube(size=[1, 22.4, 1], center=true);
        }
      }
    }
    cube(size=[18, 18, 6.1], center=true);
  }
}
