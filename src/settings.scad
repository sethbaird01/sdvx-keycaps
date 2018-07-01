/* [Basic-Settings] */

// Length in units of key. A regular key is 1 unit; spacebar is usually 6.25
$key_length = 1.0; // Range not working in thingiverse customizer atm [1:0.25:16]

// What type of stem you want. Most people want Cherry.
$stem_type = "cherry";  // [cherry, alps, rounded_cherry, box_cherry, filled, disable]

// The stem is the hardest part to print, so this variable controls how much 'slop' there is in the stem
$stem_slop = 0.3; // Not working in thingiverse customizer atm [0:0.01:1]

// Font size used for text
$font_size = 6;

// Set this to true if you're making a spacebar!
$inverted_dish = false;


// Support type. default is "flared" for easy FDM printing; bars are more realistic, and flat could be for artisans
$support_type = "flared"; // [flared, bars, flat, disable]

// Supports for the stem, as it often comes off during printing. disabled by default, but highly reccommended.
$stem_support_type = "disable"; // [tines, brim, disabled]

/* [Advanced] */

/* Key */
// Height in units of key. should remain 1 for most uses
$key_height = 1.0;
// Keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
$keytop_thickness = 1;
// Wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
$wall_thickness = 3;
// Radius of corners of keycap
$corner_radius = 1;
// Width of the very bottom of the key
$bottom_key_width = 18.16;
// Height (from the front) of the very bottom of the key
$bottom_key_height = 18.16;
// How much less width there is on the top. eg top_key_width = bottom_key_width - width_difference
$width_difference = 6;
// How much less height there is on the top
$height_difference = 4;
// How deep the key is, before adding a dish
$total_depth = 11.5;
// The tilt of the dish in degrees. divided by key height
$top_tilt = -6;
// How skewed towards the back the top is (0 for center)
$top_skew = 1.7;

/* Stem */

// How far the throw distance of the switch is. determines how far the 'cross' in the cherry switch digs into the stem, and how long the keystem needs to be before supports can start. luckily, alps and cherries have a pretty similar throw. can modify to have stouter keycaps for low profile switches, etc
$stem_throw = 4;
// Diameter of the outside of the rounded cherry stem
$rounded_cherry_stem_d = 5.5;


// How much higher the stem is than the bottom of the keycap.
// Inset stem requires support but is more accurate in some profiles
$stem_inset = 0;
// How many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;

/* Shape */

// Key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square";
// ISO enter needs to be linear extruded NOT from the center. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// How many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
// If you're doing fancy bowed keycap sides, this controls how many slices you take
$height_slices = 1;

/* Dish */

// What type of dish the key has. note that unlike stems and supports a dish ALWAYS gets rendered.
$dish_type = "cylindrical"; // [cylindrical, spherical, sideways cylindrical, old spherical, disable]
// How deep the dish 'digs' into the top of the keycap. this is max depth, so you can't find the height from total_depth - dish_depth. besides the top is skewed anyways
$dish_depth = 1;
// How skewed in the x direction the dish is
$dish_skew_x = 0;
// How skewed in the y direction (height) the dish is
$dish_skew_y = 0;
// If you need the dish to extend further, you can 'overdraw' the rectangle it will hit
$dish_overdraw_width = 0;
// Same as width but for height
$dish_overdraw_height = 0;

/* Misc */
// There's a bevel on the cherry stems to aid insertion / guard against first layer squishing making a hard-to-fit stem.
$cherry_bevel = true;

// How tall in mm the stem support is, if there is any. stem support sits around the keystem and helps to secure it while printing.
$stem_support_height = 0.4;
// Font used for text
$font="DejaVu Sans Mono:style=Book";
// Whether or not to render fake keyswitches to check clearances
$clearance_check = false;
// Use linear_extrude instead of hull slices to make the shape of the key
// Should be faster, also required for concave shapes
$linear_extrude_shape = false;
//should the key be rounded? unnecessary for most printers, and very slow
$rounded_key = false;
//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 for G20
$minkowski_radius = .33;

/* Features */

//insert locating bump
$key_bump = false;
//height of the location bump from the top surface of the key
$key_bump_depth = 0.5;
//distance to move the bump from the front edge of the key
$key_bump_edge = 0.4;

/* [Hidden] */

//list of legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
// Currently does not work with thingiverse customizer, and actually breaks it
$legends = [];

// Dimensions of alps stem
$alps_stem = [4.45, 2.25];

// Enable stabilizers. If you don't want stabilizers use disable; most other keycaps use Cherry stabilizers
$stabilizer_type = "cherry"; // [cherry, rounded_cherry, alps, disable]

// Ternaries are ONLY for customizer. they will NOT work if you're using this in
// OpenSCAD. you should use stabilized(), openSCAD customizer,
// or set $stabilizers directly
// Array of positions of stabilizers
$stabilizers = $key_length >= 6 ? [[-50, 0], [50, 0]] : $key_length >= 2 ? [[-12,0],[12,0]] : [];

// Where the stems are in relation to the center of the keycap, in units. default is one in the center
// Shouldn't work in thingiverse customizer, though it has been...
$stem_positions = [[0,0]];
