fenderWidth = 46;
fenderThick = 5;
stayAngle = asin(45/(13*25.4));
stayAngle = 12;
echo(stayAngle);
module fenderStay(dir=1) {
    translate([0,8,0]) {
        rotate([90,0,stayAngle*dir]) cylinder(d=5, h=13*25.4, center=false);
        translate([0,-9,0]) rotate([90,0,90*dir+stayAngle*dir]) cylinder(d=3.5, h=12, center=false);
    }
}
rotate([-stayAngle,0,0]) intersection() {

    rotate([0,0,0]) difference() {
        union() {
            hull() {
                translate([fenderWidth/2-2, 0, 0]) cylinder(d=fenderThick*2.5, h=15, center=true);
                translate([-fenderWidth/2+2, 0, 0]) cylinder(d=fenderThick*2.5, h=15, center=true);
                translate([0,30,18/2]) rotate([stayAngle,0,0]) cylinder(d=20, h=8, center=true);
            }
        }
        #cube([fenderWidth, fenderThick, 25], center=true);
        for (xx=[-9:18:9]) {
            translate([xx,-(fenderThick/2+2),0]) rotate([90,0,0]) cylinder(d=9.8, h=6, center=false);
            translate([xx, 0, 0]) {
                rotate([-90,0,0]) cylinder(d=3.4, h=12, center=false, $fn=12);
                rotate([90,0,0]) cylinder(d=4.6, h=25, center=false, $fn=12);
            }
        }
        #translate([0,30,18/2]) rotate([stayAngle,0,0]) {
            rotate([180,0,0]) cylinder(d=13, h=10, center=false);
            cylinder(d=6, h=25, center=true);
        }

    }
    translate([0,0,-1]) rotate([stayAngle,0,0]) cube([100, 100,15], center=true);
}

offset=15;
