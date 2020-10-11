$fs = 1;
$fa = 6;

difference() {
  cylinder(d=30, h=1 + 3.5 + 2, center=false);
  translate([0,0,1 + 3.5]) cylinder(d=25, h=100, center=false);
  translate([0,0,1]) cylinder(d=10, h=100, center=false);
  cylinder(d=6, h=100, center=true);
}
