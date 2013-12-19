$(document).ready(function() {
  // define function for Jcrop callback to store plugin reference
  var jcrop;
  var storeJcrop = function() {
    jcrop = this;
  };

  initJcrop(storeJcrop, null);

  // update jcrop when image source changes
  $("#dream_image").change(function() {
    // remove Jcrop from target
    // jcrop.destroy();

    // update image source
    var image_src = $(this).val();
    jcrop.setImage(image_src);

    // add Jcrop back to image target
    // initJcrop(storeJcrop, true);
  });
});

// initialize Jcrop and connect to the target image
function initJcrop(storeJcrop, resetCrop) {
  var IMAGE_HEIGHT = 330;
  var IMAGE_WIDTH = 220;

  var crop_x = setValue($("#crop_x").val(), 0, resetCrop);
  var crop_y = setValue($("#crop_y").val(), 0, resetCrop);
  var crop_w = setValue($("#crop_w").val(), IMAGE_WIDTH, resetCrop);
  var crop_h = setValue($("#crop_h").val(), IMAGE_HEIGHT, resetCrop);

  dream_crop = $("#dream_crop");
  dream_crop.Jcrop({
    aspectRatio: IMAGE_WIDTH / IMAGE_HEIGHT,
    boxHeight: IMAGE_HEIGHT,
    boxWidth: 0,
    onChange: updateCrop,
    onSelect: updateCrop,
    setSelect: [ crop_x, crop_y, crop_x + crop_w, crop_y + crop_h ]
  },
  storeJcrop);
}

// use the value or, if null, the default. if the reset flag is set, use the default.
function setValue(value, defaultValue, reset) {
  return (reset) ? defaultValue : value || defaultValue;
}

// update crop attributes with new values
function updateCrop(coords) {
  $("#crop_x").val(coords.x);
  $("#crop_y").val(coords.y);
  $("#crop_w").val(coords.w);
  $("#crop_h").val(coords.h);
}
