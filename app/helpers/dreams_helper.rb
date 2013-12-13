module DreamsHelper
  IMAGE_HEIGHT = 330
  IMAGE_WIDTH = 220

  def dream_image_title(dream)
    if dream.completed_at
      "#{dream.description} (completed #{distance_of_time_in_words_to_now(dream.completed_at)} ago)"
    else
      dream.description
    end
  end

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
