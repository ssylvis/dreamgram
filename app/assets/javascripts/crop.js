$(document).ready(function() {
  var IMAGE_HEIGHT = 330
  var IMAGE_WIDTH = 220

  $('#cropbox').Jcrop({
    onChange: updateCrop,
    onSelect: updateCrop,
    setSelect: [ 0, 0, IMAGE_WIDTH, IMAGE_HEIGHT ],
    aspectRatio: IMAGE_WIDTH / IMAGE_HEIGHT
  });
});

function updateCrop(coords) {
  $('#crop_x').val(coords.x);
  $('#crop_y').val(coords.y);
  $('#crop_w').val(coords.w);
  $('#crop_h').val(coords.h);
}
