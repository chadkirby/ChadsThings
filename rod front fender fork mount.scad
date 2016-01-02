module daruma() {
    cylinder(d=0.375 * 25.4, h=25, center=false);
    cylinder(d=6, h=50, center=true);
}
len = 24;

fenderD = 622/2 + 40;
rake = 62; // 40;
forkLen = 400;
rakeOffsetAngle = 90 - atan(forkLen/rake);

module fender() {
	d = fenderD;
	r = 6;
	translate([0, 0, -17.5])
		rotate([rakeOffsetAngle,0,0])
			translate([0, 0, -d - r])
				rotate([0,90,0])
					rotate_extrude($fn=120)
						translate([ d, 0, 0]) square(size=[r, 60], center=true);;
}

rotate([-rakeOffsetAngle,0,0]) difference() {
    rotate([rakeOffsetAngle,0,0]) translate([0,0,-2.5]) hull() {
        cylinder(d=15, h=len, center=true);
        translate([0,-13,-len/2]) cylinder(d=15, h=len/2, center=false);
        translate([0,13,-len/2]) cylinder(d=15, h=len/2, center=false);
    }
    rotate([rakeOffsetAngle,0,0])
    for (ii=[-13:26:13]) {
        translate([0,ii,0]) {
            cylinder(d=6, h=100, center=true);
            translate([0,0,-len/2 + 4]) cylinder(d=8.4/cos(180/6), h=100, center=false, $fn=6);
        }
    }

    #daruma();
    // bolt head to daruma
    translate([0,0,-4 - len/2]) cylinder(d=10.5, h=10, center=false);
    fender();
    /*rotate([0,180,0]) cube([10, 310, 5.75*25.4]);
    #rotate([0,180,0]) cube([10, 310, 5.25*25.4]);*/
}
