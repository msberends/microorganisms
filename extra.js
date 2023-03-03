/*
# ==================================================================== #
# TITLE                                                                #
# microorganisms: An R Package for Microbial Taxonomy Reference Data   #
#                                                                      #
# SOURCE                                                               #
# https://github.com/msberends/microorganisms                          #
#                                                                      #
# This R package is free software; you can freely use and distribute   #
# it for both personal and commercial purposes under the terms of the  #
# GNU General Public License version 2.0 (GNU GPL-2), as published by  #
# the Free Software Foundation.                                        #
# ==================================================================== #
*/

$(document).ready(function() {

  // Replace 'Developers' with 'Maintainers' on the main page, and "Contributors" on the Authors page
  $(".developers h2").text("Maintainers");
  $(".citation h2:nth(0)").text("Contributors");
  $(".citation h2:nth(1)").text("How to Cite");

  // add doctoral titles to authors
  function doct_tit(x) {
    if (typeof(x) != "undefined") {
      x = x.replace(/Author, maintainer/g, "Principle maintainer");
      x = x.replace(/Author, contributor/g, "Contributing maintainer");
      // contributors
      x = x.replace("Christian", "Dr. Christian");
      x = x.replace("Dennis", "Dr. Dennis");
      x = x.replace("Matthijs", "Dr. Matthijs");
    }
    return(x);
  }
  $(".template-authors").html(doct_tit($(".template-authors").html()));
  $(".template-citation-authors").html(doct_tit($(".template-citation-authors").html()));
  $(".developers").html(doct_tit($(".developers").html()));
  $(".developers a[href='authors.html']").text("All contributors...");
});
