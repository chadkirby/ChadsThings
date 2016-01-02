fenderWidth = 46;
fenderThick = 5;
stayAngle = 0;
offset = 14;
rotate([-stayAngle,0,0]) {

    rotate([0,0,0]) difference() {
      {
            hull() {
                translate([fenderWidth/2-2, 0, 0]) cylinder(d=fenderThick+8, h=15, center=true);
                translate([-fenderWidth/2+2, 0, 0]) cylinder(d=fenderThick+8, h=15, center=true);
                rotate([stayAngle,0,0]) translate([0,offset,15/2 - 5/2]) cylinder(d=15, h=5, center=true);
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
        rotate([stayAngle,0,0]) translate([0,offset,15/2 - 3])  {
            hull() {
                translate([0,-2,0]) rotate([180,0,0]) cylinder(d=19, h=15, center=false);
                translate([0,10,0]) rotate([180,0,0]) cylinder(d=19, h=15, center=false);

            }
            cylinder(d=6, h=25, center=true);
        }

    }
}

offset=15;
