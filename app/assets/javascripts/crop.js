$(document).ready(function() {
  var IMAGE_HEIGHT = 330
  var IMAGE_WIDTH = 220

  var crop_x = $('#crop_x').val() || 0;
  var crop_y = $('#crop_y').val() || 0;
  var crop_w = $('#crop_w').val() || IMAGE_WIDTH;
  var crop_h = $('#crop_h').val() || IMAGE_HEIGHT;

  $('#cropbox').Jcrop({
    onChange: updateCrop,
    onSelect: updateCrop,
    setSelect: [ crop_x, crop_y, crop_x + crop_w, crop_y + crop_h ],
    aspectRatio: IMAGE_WIDTH / IMAGE_HEIGHT
  });
});

function updateCrop(coords) {
  $('#crop_x').val(coords.x);
  $('#crop_y').val(coords.y);
  $('#crop_w').val(coords.w);
  $('#crop_h').val(coords.h);
}
