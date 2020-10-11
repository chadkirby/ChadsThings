$fs = 1;
$fa = 6;

module tire(args) {
  translate([0, 0, 350]) rotate([0, 90, 0]) rotate_extrude() {
    translate([350 - 35/2, 0, 0]) circle(d=35);
  }
}

module innerRing(args) {
  difference() {
    cylinder(d=146 + 24, h=9, center=false);
    cylinder(d=145.5, h=100, center=true);
  }
}

holeD = (6 + 3/16) * 25.4;

rotate([180,0,0]) // flip for printing
intersection() {
  difference() {
    cylinder(d=145 + 24, h=15, center=false);
    innerRing();

    translate([holeD/2,0,0]) cylinder(d=8.5, h=100, center=true);
    translate([-holeD/2,0,0]) cylinder(d=8.5, h=100, center=true);

    for (angle=[30, -30]) {
      for (div=[4, -4]) {
        rotate_extrude(angle = angle) {
          translate([130/div,0,0]) square(size=[130/2, 100], center=true);
        }
      }
    }


    cylinder(d=115, h=100, center=true);;
    translate([0,0,2]) tire();
  }

  translate([0,0,77]) rotate([0,0,45]) cube(size=[145, 145, 150], center=true);
}

*difference() {
  cylinder(d=16, h=12, center=true);
  cylinder(d=9, h=100, center=true);
  rotate_extrude() translate([14,0,0]) circle(d=15);
}

*translate([25,0,0]) difference() {
  cylinder(d=14, h=12, center=true);
  cylinder(d=5.5, h=100, center=true);
  rotate_extrude() translate([13,0,0]) circle(d=15);
}
