use <MCAD/boxes.scad>

// Using MM as units

// Length, Width, Height
mainBox=[57.760, 23.74, 5.525];
insideBox=[54.20, 19.79, 8.526];
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
}