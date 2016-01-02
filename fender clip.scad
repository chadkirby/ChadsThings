stayR = 5.2/2;
thick = 7;
holeSpacing = 0.55 * 25.4;
hOffset = holeSpacing/2 + 1.5;
height = 10;
radius = height * 0.4;
stayZ = height - stayR - 3;
big = 100;
$fs = 1;
module mainBody() {
    difference() {
        rotate([90,0,0])
        difference() {
            hull() {
                for (ii=[-1:2:1]) {
                    translate([
                        ii * (stayR + hOffset - radius),
                        height - radius,
                        0
                    ]) cylinder(r=radius, h=thick, center=true);
                }
                translate([0,1,0]) cube([2*(stayR+hOffset), 2, thick], center=true);
            }
            translate([0, stayZ, 0]) cylinder(r=stayR, h=big, center=true);
        }

        for (ii=[-1:2:1]) {
            translate([ii * (holeSpacing/2),0,-0.1]) cylinder(d=3.9, h=10.1, center=false);
        }

        insert(1);

        *hull() {
            cylinder(d=thick/cos(180/6), h=1, center=false, $fn=6);
            translate([0,0,stayZ - 1])
                scale([(thick + 0.5)/thick, 1, 1])
                    cylinder(d=thick/cos(180/6), h=0.5, center=false, $fn=6);
        }

    }
}

module insert(enlarge = 0) {
    offset = 0.5;
    difference() {
        cylinder(d1=(thick-1 + enlarge)/cos(180/6), d2=(thick+enlarge)/cos(180/6), h=stayZ - 1 + enlarge/2, center=false, $fn=6);
        translate([0,0,stayZ + offset]) rotate([90,0,0]) cylinder(r=stayR, h=big, center=true);


    }
}
mainBody();
insert();
