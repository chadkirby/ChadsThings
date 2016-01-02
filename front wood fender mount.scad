fenderWidth = 46;
fenderThick = 5;

stayAngle = asin(6/(11*25.4));

otherAngle = atan(90/250);

module fenderStay(dir=1) {
    translate([0,8,0]) {
        rotate([90,0,stayAngle*dir]) cylinder(d=5, h=13*25.4, center=false);
        /*translate([0,-9,0]) rotate([90,0,90*dir+stayAngle*dir]) cylinder(d=3.5, h=12, center=false);*/
    }
}

rotate([0,0,0]) difference() {
    union() {
        hull() {
            cube([fenderWidth+2, fenderThick+8, 15], center=true);
            /*translate([-fenderWidth/2-3, 0, 0]) cylinder(d=10, h=15, center=true);
            translate([fenderWidth/2+3, 0, 0]) cylinder(d=10, h=15, center=true);*/
        }
        for (ii=[-1:2:1]) {
            translate([ii*(fenderWidth/2+8.5),0,0]) rotate([0,90,ii*stayAngle]) difference() {
                hull() {
                    translate([0,0,-ii*6]) rotate([ii*stayAngle,0,0]) {
                        translate([0,fenderThick,0]) rotate([0,90,0]) cylinder(d=6, h=15, center=true, $fn=12);
                        translate([0,-fenderThick,0]) rotate([0,90,0]) cylinder(d=4, h=15, center=true);
                    }
                    translate([0,-offset,ii]) rotate([0,0,22.5]) cylinder(d=15/cos(180/8), h=8, center=true, $fn=8);
                }

                translate([0,-offset,-ii*4]) cylinder(d=10.3, h=10, center=true);
                #translate([0,-offset,-5*ii]) rotate([90,0,-otherAngle]) cylinder(d=5, h=100, center=true, $fn=12);

                translate([0,-offset,0]) cylinder(d=5.75, h=10, center=true);
            }
        }
    }

    cube([fenderWidth, fenderThick, 25], center=true);
    *translate([fenderWidth/2 + 4,0,0]) fenderStay(1);
    *translate([-(fenderWidth/2 + 4),0,0]) fenderStay(-1);
    for (xx=[-9:18:9]) {
        translate([xx,-(fenderThick/2+2.1),0]) rotate([90,0,0]) cylinder(d=9.8, h=6, center=false);
        translate([xx, 0, 0]) {
            rotate([-90,0,0]) cylinder(d=3.4, h=25, center=false, $fn=12);
            rotate([90,0,0]) cylinder(d=4.6, h=25, center=false, $fn=12);
        }
    }
    #translate([0,-32,0]) cylinder(d=34, h=10, center=true);
}
offset=12;
