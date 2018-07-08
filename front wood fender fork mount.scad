fenderWidth = 46;
fenderThick = 5;
stayAngle = 18;

rotate([-stayAngle,0,0]) intersection() {

    rotate([0,0,0]) difference() {
      {
            hull() {
                translate([fenderWidth/2-2, 0, 0]) cylinder(d=fenderThick+8, h=15, center=true);
                translate([-fenderWidth/2+2, 0, 0]) cylinder(d=fenderThick+8, h=15, center=true);
                rotate([stayAngle,0,0]) translate([0,34,15/2 - 3]) cylinder(d=16, h=6, center=true);
            }
        }
        cube([fenderWidth, fenderThick, 25], center=true);
        for (xx=[-9:18:9]) {
            translate([xx,-(fenderThick/2+2),0]) rotate([90,0,0]) cylinder(d=9.8, h=6, center=false);
            translate([xx, 0, 0]) {
                rotate([-90,0,0]) cylinder(d=3.4, h=12, center=false, $fn=12);
                rotate([90,0,0]) cylinder(d=4.6, h=25, center=false, $fn=12);
            }
        }
        rotate([stayAngle,0,0]) translate([0,34,15/2 - 4])  {
            rotate([180,0,0]) cylinder(d=13, h=10, center=false);
            cylinder(d=6, h=25, center=true);
        }

    }
    translate([0,0,-1]) rotate([stayAngle,0,0]) cube([100, 100,15], center=true);
}

offset=15;
