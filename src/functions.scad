// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;
