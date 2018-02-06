// key profile definitions

// unlike the other files with their own dedicated folders, this one doesn't need a selector. it just collects all the functions
include <key_profiles/dcs.scad>
include <key_profiles/oem.scad>
include <key_profiles/dsa.scad>
include <key_profiles/sa.scad>
include <key_profiles/g20.scad>

// man, wouldn't it be so cool if functions were first order
module key_profile(key_profile_type, row) {
  if (key_profile_type == "dcs") {
    dcs_row(row) children();
  } else if (key_profile_type == "oem") {
    oem_row(row) children();
  } else if (key_profile_type == "dsa") {
    dsa_row(row) children();
  } else if (key_profile_type == "sa") {
    sa_row(row) children();
  } else if (key_profile_type == "g20") {
    g20_row(row) children();
  }
}
