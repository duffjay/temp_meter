// meter plate
//  -- derived from /corsair_mount/meter_plate
//  BUT NOT A COPY -- if you need the original
//     go back to /corsair_mount
//     this is a 'branch'

// thread the mounting block
// pass-through the plate (vertically

//DELETE rail_width = 20;

plate_x = 46 + 12;
plate_y = 50;
plate_z = 3;

deck_mouunt_centerline = 30;

mounting_block_x = 10;
mounting_block_y = 8;
mounting_block_z = 8;

bezel_thickness = plate_z;

m4_pilot = 3.2;
m4_dia = 4;

vert_m4_x_offset = 15;

$fn = 50;

difference () {
    {
    union () {
        cube([plate_x, plate_y, plate_z], center = true);
        
        // mounting block
        translate([-plate_x/2 + mounting_block_x/2,
            -plate_y/2 + mounting_block_y/2,
            plate_z/2 +  mounting_block_z/2])
        cube([mounting_block_x, mounting_block_y, mounting_block_z], center = true);
        
        // mounting block
        translate([plate_x/2 - mounting_block_x/2,
            -plate_y/2 +  mounting_block_y/2,
            plate_z/2 +  mounting_block_z/2])
        cube([mounting_block_x, mounting_block_y, mounting_block_z], center = true);
        }
    }
    // subtract
    {
        // threaded mounting holes
        echo ("mounting hole center from deck surface", plate_z/2 + mounting_block_z/2 - 1.5);
        translate([-(plate_x/2 - mounting_block_x/2),
            -(plate_y/2  - mounting_block_y/2) ,
            plate_z/2 + mounting_block_z/2 - 1.5])
        rotate([90,0,0])
        cylinder(r = m4_pilot/2, h = mounting_block_y, center = true);
        
        translate([(plate_x/2 - mounting_block_x/2),
            -(plate_y/2 - mounting_block_y/2) ,
            plate_z/2 + mounting_block_z/2 - 1.5])
        rotate([90,0,0])
        cylinder(r = m4_pilot/2, h = mounting_block_y, center = true);
        // pass thru mounting holes
        
        // pass-thru holes 
        // outboard
        translate([vert_m4_x_offset,
            (plate_y/2  - 5),
            0])
        cylinder(r = m4_dia/2, h = plate_z, center = true);
        
        translate([-vert_m4_x_offset,
            (plate_y/2 - 5),
            0])
        cylinder(r = m4_dia/2, h = plate_z, center = true);
        // inboard
        translate([vert_m4_x_offset,
            (plate_y/2 - 20),
            0])
        cylinder(r = m4_dia/2, h = plate_z, center = true);
        
        translate([-vert_m4_x_offset,
            (plate_y/2 - 20),
            0])
        cylinder(r = m4_dia/2, h = plate_z, center = true);    
        // slots
        translate([-vert_m4_x_offset,
            (plate_y/2 - (20-5)/2 - (20-5)/2 + 3 ),
            0])
        cube([m4_dia, 15, plate_z], center = true);

        translate([vert_m4_x_offset,
            (plate_y/2 - (20-5)/2 - (20-5)/2 + 3 ),
            0])
        cube([m4_dia, 15, plate_z], center = true);
    }
}