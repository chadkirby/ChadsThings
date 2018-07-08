$fs = 1;
$fa = 6;

module _ry() {
    rotate([90,0]) children();
}
module _rx() {
    rotate([0,90]) children();
}

module tube(inflate = 0) {
  hull() {
    for (yy=[0.5 + inflate/2, -0.5 - inflate/2]) {
      translate([0, yy, 0]) cylinder(d=8 + inflate, h=100, center=true);
    }
  }
}

module seatTubes(dist = 25, inflate = 0) {
  for (xx=[-dist, dist]) {
    translate([xx, 0, 0]) rotate([0, 15 * sign(xx)]) tube(inflate);
  }
}

module co2(args) {
  cylinder(d=10, h=10, center=false);
  translate([0, 0, -0.5]) cylinder(d=12.25, h=3.5, center=false);
  hull() {
    translate([0, 0, 100]) sphere(d=22.5);
    translate([0, 0, 25]) sphere(d=22.5);
    translate([0, 0, 10]) cylinder(d=10, h=1, center=false);
  }
}

module tanks(args) {
  for (xx=[-12, 12]) {
    translate([xx, 8, 10]) _ry() co2();
  }
}

module backPlate(args) {
  difference() {
    intersection() {
      hull() seatTubes(dist=30);
      translate([0, 0, 10]) cube(size=[100, 6.5, 20], center=true);
    }
  } 
}
module frontPlate(args) {
  difference() {
    intersection() {
      hull() seatTubes(dist=30, inflate=3);
      translate([0, 0, 10]) cube(size=[100, 100, 20], center=true);
    }
  } 
}

difference() {
  union() {
    translate([0, 5]) backPlate();
    translate([0, -8]) frontPlate();
  }
  seatTubes(inflate = 1);
  tanks();
}