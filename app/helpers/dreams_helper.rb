module DreamsHelper
  IMAGE_HEIGHT = 330
  IMAGE_WIDTH = 220

  def image_style(dream)
    if dream.cropped?
      ratio = IMAGE_HEIGHT / dream.crop_h.to_f
      height = IMAGE_HEIGHT * ratio
      left = dream.crop_x * ratio
      top = dream.crop_y * ratio
      "height: #{height}px; margin: #{-top}px 0 0 #{-left}px"
    else
      "height: #{IMAGE_HEIGHT}px"
    end
  end
end
