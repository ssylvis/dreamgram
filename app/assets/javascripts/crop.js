$(function() {
  $('#cropbox').Jcrop({
    onChange: updateCrop,
    onSelect: updateCrop,
    setSelect: [ 0, 0, 220, 330 ],
    aspectRatio: 220 / 330
  });
});

function updateCrop(coords) {
  $('#crop_x').val(coords.x);
  $('#crop_y').val(coords.y);
  $('#crop_w').val(coords.w);
  $('#crop_h').val(coords.h);
}
