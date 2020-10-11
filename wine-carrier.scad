$fs = 1;
$fa = 1;

difference() {
  union() {
    cylinder(d=115, h=4);
    cylinder(d=100, h=25);
  }
  translate([0, 0, 6]) cylinder(d=85, h=100);

  translate([0, 25, 0]) cylinder(d=25, h=100, center=true);
  translate([0, -25, 0]) cylinder(d=25, h=100, center=true);
  translate([25, 0, 0]) cylinder(d=25, h=100, center=true);
  translate([-25, 0, 0]) cylinder(d=25, h=100, center=true);
}

*difference() {
  cylinder(d=100, h=25);
  cylinder(d=90, h=100, center=true);
}
