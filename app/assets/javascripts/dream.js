$(document).ready(function() {
  var SHOW_DELAY = 25;
  $(".dream").hover(function() {
    $(this).find(".edit-buttons").not(".show").show(SHOW_DELAY);
  }, function() {
    $(this).find(".edit-buttons").not(".show").hide(SHOW_DELAY);
  });
});
