use <MCAD/boxes.scad>

// Using MM as units

// Length, Width, Height
mainBox=[57.760, 23.74, 5.525];
lidBox=[mainBox[0], mainBox[1], 2];
// Y is offset wrong, possibly because of my printer
// 19.85 comes out to 19.19
insideBox=[54.20, 19.95, 8.526];
lidInside=[54.20, 19.95, 3];
usbBox=[59, 11.95, 10.5];
sdBox=[16.66, 14.42, 1.88 * 2];
compBox=[29.15, 18.4, 1.88 * 2];

difference() {
    roundedBox(mainBox, 2, true);
    translate([0,0,4]) {
        cube(insideBox, true);
    }
    translate([5,0,5]) {
        cube(usbBox, true);
    }
    translate([-17,-1.5,0]) {
        cube(sdBox, true);
    }
    translate([12,0,0]) {
        cube(compBox, true);
    }
    translate([0, lidBox[1] / -2, 0]) {
        cube([6, (lidBox[1] - lidInside[1]) / 2, 3], center=false);
    }
    translate([-6, (lidBox[1] / 2) - 1.9, 0]) {
        cube([6, (lidBox[1] - lidInside[1]) / 2, 3], center=false);
    }
}



module hole() {
    cylinder(h=5, r1=2, r2=2, center=true);
}

translate([0, 25, -1.8]) {
    difference() {
        roundedBox(lidBox, 2, true);
        hole();
        translate([0,6,0]) { hole(); }
        translate([0,-6,0]) { hole(); }
        translate([-6,0,0]) { hole(); }
        translate([6,0,0]) { hole(); }
        translate([6,6,0]) { hole(); }
        translate([-6,-6,0]) { hole(); }
        translate([6,-6,0]) { hole(); }
        translate([-6,6,0]) { hole(); }
        translate([0,0,1.2]) {
            cube(lidInside, true);
            
        }
    }
    translate([0, lidBox[1] / -2, 0]) {
        cube([6, (lidBox[1] - lidInside[1]) / 2, 3], center=false);
    }
    translate([-6, (lidBox[1] / 2) - 1.9, 0]) {
        cube([6, (lidBox[1] - lidInside[1]) / 2, 3], center=false);
    }
}