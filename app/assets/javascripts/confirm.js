// Override default UJS behavior to display custom dialog instead. Inspired by:
// http://lesseverything.com/blog/archives/2012/07/18/customizing-confirmation-dialog-in-rails/
$.rails.allowAction = function(element) {
  // Ignore non data-confirm elements
  if (!element.attr("data-confirm")) {
    return true;
  }
  // Show custom dialog instead
  $.rails.showConfirmDialog(element);
  // Custom dialog is async so we always cancel the action
  return false;
};

$.rails.confirmed = function(element) {
  // Element is confirmed and we want to invoke the default element behavior. So
  // we remove the "data-confirm" attribute and re-click the element.
  element.removeAttr("data-confirm");
  element.trigger("click.rails");
};

$.rails.showConfirmDialog = function(element) {
  var dialogId = element.data("confirm");
  // Attach callback to primary button click
  $(dialogId + " .btn-primary").on("click", function() {
    $.rails.confirmed(element);
  });
  $(dialogId).modal();
};
