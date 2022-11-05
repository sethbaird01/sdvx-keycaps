use <src/key.scad>

include <src/key_sizes.scad>
include <src/key_profiles.scad>
include <src/key_types.scad>
include <src/key_transformations.scad>
include <src/key_helpers.scad>
include <src/key_layouts.scad>

/* [Basic-Settings] */

// Length in units of key. A regular key is 1 unit; spacebar is usually 6.25
$key_length = 2.75; // Range not working in thingiverse customizer atm [1:0.25:16]

// What type of stem you want. Most people want Cherry.
$stem_type = "cherry";  // [cherry, alps, rounded_cherry, box_cherry, filled, disable]

// The stem is the hardest part to print, so this variable controls how much 'slop' there is in the stem
// if your keycaps stick in the switch raise this value
$stem_slop = 0.35; // Not working in thingiverse customizer atm [0:0.01:1]
// broke this out. if your keycaps are falling off lower this value. only works for cherry stems rn
$stem_inner_slop = 0.2;

// Font size used for text
$font_size = 6;

// Set this to true if you're making a spacebar!
$inverted_dish = true;

// change aggressiveness of double sculpting
// this is the radius of the cylinder the keytops are placed on
$double_sculpt_radius = 0;


// Support type. default is "flared" for easy FDM printing; bars are more realistic, and flat could be for artisans
$support_type = "flared"; // [flared, bars, flat, disable]

// Supports for the stem, as it often comes off during printing. Reccommended for most machines
$stem_support_type = "disabled"; // [tines, brim, disabled]

// make legends outset instead of inset.
// broken off from artisan support since who wants outset legends?
$outset_legends = false;

/* [Key] */
// Height in units of key. should remain 1 for most uses
$key_height = 1.2;
// Keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
$keytop_thickness = 0;
// Wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
$wall_thickness = 2;
// Radius of corners of keycap
$corner_radius = 1;
// Width of the very bottom of the key
$bottom_key_width = 25;
// Height (from the front) of the very bottom of the key
$bottom_key_height = 21;
// How much less width there is on the top. eg top_key_width = bottom_key_width - width_difference
$width_difference = 0;
// How much less height there is on the top
$height_difference = 0;
// How deep the key is, before adding a dish
$total_depth = 12;
// The tilt of the dish in degrees. divided by key height
$top_tilt = 0;
// the y tilt of the dish in degrees. divided by key width.
// for double axis sculpted keycaps and probably not much else
$top_tilt_y = 0;
// How skewed towards the back the top is (0 for center)
$top_skew = 0;

// how skewed towards the right the top is. unused, but implemented.
// for double axis sculpted keycaps and probably not much else
$top_skew_x = 0;

/* [Stem] */

// How far the throw distance of the switch is. determines how far the 'cross' in the cherry switch digs into the stem, and how long the keystem needs to be before supports can start. luckily, alps and cherries have a pretty similar throw. can modify to have stouter keycaps for low profile switches, etc
$stem_throw = 7;
// Diameter of the outside of the rounded cherry stem
$rounded_cherry_stem_d = 5.5;


// How much higher the stem is than the bottom of the keycap.
// Inset stem requires support but is more accurate in some profiles
$stem_inset = 2;
// How many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 45;

// enable to have stem support extend past the keycap bottom, to (hopefully) the next
// keycap. only works on tines right now
$extra_long_stem_support = false;

/* [Shape] */

// Key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square";
// ISO enter needs to be linear extruded NOT from the center when not using skin. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// How many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
// If you're doing fancy bowed keycap sides, this controls how many slices you take
$height_slices = 1;

/* [Dish] */

// What type of dish the key has. note that unlike stems and supports a dish ALWAYS gets rendered.
$dish_type = "spherical"; // [cylindrical, spherical, sideways cylindrical, old spherical, disable]
// How deep the dish 'digs' into the top of the keycap. this is max depth, so you can't find the height from total_depth - dish_depth. besides the top is skewed anyways
$dish_depth = 0;
// How skewed in the x direction the dish is
$dish_skew_x = 0;
// How skewed in the y direction (height) the dish is
$dish_skew_y = 0;


$dish_offset_x = 0;

// If you need the dish to extend further, you can 'overdraw' the rectangle it will hit. this was mostly for iso enter and should be deprecated
$dish_overdraw_width = 0;
// Same as width but for height
$dish_overdraw_height = 0;

/* [Misc] */
// There's a bevel on the cherry stems to aid insertion / guard against first layer squishing making a hard-to-fit stem.
$cherry_bevel = true;

// How tall in mm the stem support is, if there is any. stem support sits around the keystem and helps to secure it while printing.
$stem_support_height = .8;
// Font used for text
$font="DejaVu Sans Mono:style=Book";
// Whether or not to render fake keyswitches to check clearances
$clearance_check = false;
// Should be faster, also required for concave shapes
// Use linear_extrude instead of hull slices to make the shape of the key
$linear_extrude_shape = false;

// warns in trajectory.scad but it looks benign
// brand new, more correct, hopefully faster, lots more work
$skin_extrude_shape = false;
// This doesn't work very well, but you can try
$rounded_key = false;
//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 for G20
$minkowski_radius = .33;

/* [Features] */

//insert locating bump
$key_bump = false;
//height of the location bump from the top surface of the key
$key_bump_depth = 0.5;
//distance to move the bump from the front edge of the key
$key_bump_edge = 0.4;

/* [Hidden] */

// set this to true if you are making double sculpted keycaps
$double_sculpted = false;

//list of legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
// Currently does not work with thingiverse customizer, and actually breaks it
$legends = [];

//list of front legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
// Currently does not work with thingiverse customizer, and actually breaks it
$front_legends = [];

// print legends on the front of the key instead of the top
$front_print_legends = false;

// how recessed inset legends / artisans are from the top of the key
$inset_legend_depth = 0.2;

// Dimensions of alps stem
$alps_stem = [4.45, 2.25];

// Enable stabilizer stems, to hold onto your cherry or costar stabilizers
$stabilizer_type = "disable"; // [costar_stabilizer, cherry_stabilizer, disable]

// Ternaries are ONLY for customizer. they will NOT work if you're using this in
// OpenSCAD. you should use stabilized(), openSCAD customizer,
// or set $stabilizers directly
// Array of positions of stabilizers
$stabilizers = $key_length >= 6 ? [[-50, 0], [50, 0]] : $key_length >= 2 ? [[-12,0],[12,0]] : [];

// Where the stems are in relation to the center of the keycap, in units. default is one in the center
// Shouldn't work in thingiverse customizer, though it has been...
$stem_positions = [[0,0]];

// colors
$primary_color = [.2667,.5882,1];
$secondary_color = [.4412, .7, .3784];
$tertiary_color = [1, .6941, .2];
$quaternary_color = [.4078, .3569, .749];
$warning_color = [1,0,0, 0.15];

// how many facets circles will have when used in these features
$minkowski_facets = 30;
$shape_facets =30;

// 3d surface settings
// unused for now
$3d_surface_size = 100;
// resolution in each axis. 10 = 10 divisions per x/y = 100 points total
$3d_surface_step = 10;

