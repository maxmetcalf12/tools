$(document).ready(function(){
 $(".expand-button").on("click", function(event) {
    $(".description-container").toggleClass("expanded");
    if ($(this).html() === "Read More") {
      $(this).html("Read Less");
    } else {
      $(this).html("Read More");
    }
  });
  $(".alert-container").on("click", function() {
    $(this).hide();
  })
});
