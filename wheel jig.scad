module axle(args) {
    translate([0,0,zz]) {
        rotate([0,90,0]) {
            hull() {
                cylinder(d=10, h=160, center=true);
                translate([-25,0,0]) cylinder(d=20, h=160, center=true);
            }
        }
        rotate([0,90,0]) union() {
            rotate_extrude($fn=60) translate([622/2 - 15/2,0,0]) square(size=[15, 15], center=true);
            #rotate_extrude($fn=60) translate([584/2 - 35/2,0,0]) square(size=[35, 35], center=true);
            rotate_extrude($fn=60) translate([622/2 + 42/2 + 0,0,0]) circle(d=42);
        }
    }
}

module rod1(inflate=0) {
    translate([xx, yy, 2-inflate]) rotate([0,0,0]) cylinder(d=tubed+inflate, h=len+2*inflate, center=false);
}

module rod2(inflate=0) {
    translate([110, 0, 5-inflate])
        rotate([0,-angle,0])
            cylinder(d=tubed+inflate, h=len+inflate, center=false);
}

module rod3(inflate=0) {
    translate([xx, -yy, 2-inflate]) rotate([0,0,0]) cylinder(d=tubed+inflate, h=len+2*inflate, center=false);
}

module rods(inflate=0) {
    rod1(inflate);
    rod2(inflate);
    rod3(inflate);
}

module bolt1(inflate=0) {
    translate([91, yy, 0]) cylinder(d=8 + inflate, h=20, center=false);
}
module bolt2(inflate=0) {
    translate([91, -yy, 0]) cylinder(d=8 + inflate, h=20, center=false);
}
module boltHoles(inflate=0, height=100) {
    bolt1();
    bolt2();
}

module bottomCap() {
    difference() {
        intersection() {
            union() {
                hull() {
                    rod1(10);
                    bolt1(12);
                }
                hull() {
                    rod3(10);
                    bolt2(12);
                }
                hull() {
                    rod2(10);
                    bolt1(12);
                }
                hull() {
                    rod2(10);
                    bolt2(12);
                }
            }
            translate([45,0,0]) cylinder(d=200, h=20, center=false);
        }
        #rods();
        axle();
        boltHoles();
    }
}

module topCap() {
    difference() {
        union() {
            intersection() {
                hull() {
                    rods(10);
                }
                translate([45,0,312]) cylinder(d=200, h=30, center=false);
            }
            hull() {
                translate([55,0,341]) {
                    cube([8, 34, 58], center=true);
                    translate([0,0,-15]) cube([8, 63, 25], center=true);
                }
            }
        }
        rods();
        axle();
    }
}

module gauges(height=1) {
    for (ii=[0:8]) {
        rotate([0,0,180 + 35*ii]) hull() {
            translate([0,0,(8+height)/2]) cube(size=[2, 4, 15+height], center=true);
            translate([25 + ii, 0, 4]) cube([0.25,0.25,15], center=true);
        }
    }
}
module centerGauge(zz=75) {
    translate([xx,0,zz]) difference() {
        union() {
            translate([-30,0,0]) cube([12, 40, 12], center=true);
            translate([-19,0,0]) cube([20, 12, 12], center=true);
        }
        rotate([0,-90,0]) cylinder(d=4.8, h=34, center=false, $fn=12);
    }
}
module centerGaugeBase(zz=75) {
    difference() {
        translate([0,0,zz]) {
            hull() {
                translate([xx,yy,0]) cylinder(d=tubed+4, h=12, center=true);
                translate([xx,-yy,0]) cylinder(d=tubed+4, h=12, center=true);
            }
        }
        translate([xx, 0, zz]) cube([2, 200, 25], center=true);
        translate([0, 0, zz]) rotate([0,90,0]) cylinder(d=4.8, h=200, center=true, $fn=12);
        rod1();
        rod3();
        translate([xx + 6, yy - tubed + 1, zz]) bolt832();
        translate([xx + 6, -yy + tubed - 1, zz]) bolt832();
    }
}

module bolt832() {
    rotate([0,-90,0]) {
        rotate([180,0,0]) cylinder(d=9.75, h=10, center=false);
        cylinder(d=3.75, h=15, center=false, $fn=12);
        cylinder(d=5.25, h=6.5, center=false, $fn=12);
    }
}
module lateralGauge() {
    difference() {
        union() {
            hull() {
                translate([0,-0.5, 0]) cube([20, 1, 30]);
                cylinder(d=tubed+4, h=30, center=false);
            }
            hull() {
                translate([0,-0.5, 0]) cube([45, 1, 15]);
                cylinder(d=tubed+4, h=15, center=false);
            }
        }
        cylinder(d=tubed, h=100, center=true);
    }
}
module screw() {
    translate([0, 0, -5.5]) {
        difference() {
            cylinder(d=9, h=10, center=false, $fn=20);
            rotate_extrude($fn=20) translate([5.5 + 2,0,0]) circle(r=5.5);
        }
        rotate([180,0,0]) cylinder(d=4, h=25, center=false, $fn=20);
    }
}

module gaugeBase(angle) {
    intersection() {
        difference() {
            union() {
                hull() {
                    translate([0,2,0]) cylinder(d=tubed, h=6, center=false);
                    translate([0,-32,0]) cylinder(d=10, h=6, center=false);
                    translate([25,0,0]) cylinder(d=10, h=6, center=false);
                    translate([-25,0,0]) cylinder(d=10, h=6, center=false);
                }
                hull() {
                    rotate([angle,0,0]) cylinder(d=tubed+5, h=35, center=false);
                    translate([0,-25,0]) cylinder(d=3, h=6, center=false);
                }
            }
            rotate([angle,0,0]) translate([0,0,4]) cylinder(d=tubed, h=40, center=false);
            translate([25,0,6]) screw();
            translate([0,-32,6]) screw();
            translate([-25,0,6]) screw();
        }
        cylinder(r=100, h=100, center=false);
    }
}
module radialGauge() {
    difference() {
        union() {
            hull() {
                translate([0,-0.5, 0]) cube([30, 1, 75]);
                cylinder(d=tubed+4, h=75, center=false);
            }
        }
        cylinder(d=tubed, h=100, center=false);
    }
}
module centerJig(len=100) {
    translate([0,0,zz]) {
        rotate([0,90,0]) {
            difference() {
                hull() {
                    cylinder(d=tubed, h=len, center=true);
                    translate([20,0,0]) cylinder(d=25, h=len, center=true);
                }
                cylinder(d=2*25.4/8+1, h=len + 20, center=true);
                *translate([20,0,0]) cylinder(d=18, h=len + 20, center=true);
                #rotate([0,90,0]) translate([0,0,5]) cylinder(d=tubed, h=300, center=false);
            }
        }
    }
}
len = 335;
tubed = 13.5;
xx = 56 + tubed/2;
yy = 63/2;
zz=360;
angle = 7;
bottomCap();
topCap();
*lateralGauge();
*gaugeBase(35);
*radialGauge();
centerGaugeBase();
*centerGauge();
!centerJig(100);
