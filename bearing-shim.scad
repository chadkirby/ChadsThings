$fs = 1;
$fa = 6;

difference() {
  cylinder(d=25, h=5, center=true);
  cylinder(d=24, h=100, center=true);
  translate([50,0,0]) cube(size=[100, 1, 100], center=true);
}
