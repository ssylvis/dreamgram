module DreamsHelper
  IMAGE_HEIGHT = 330
  IMAGE_WIDTH = 220

  def dream_image_title(dream)
    if dream.completed_at
      completed_ago = t('dream.completed_ago', :time => time_ago_in_words(dream.completed_at))
      "#{dream.description} (#{completed_ago})"
    else
      dream.description
    end
  end

  def image_style(dream)
    if dream.cropped?
      ratio_h = IMAGE_HEIGHT / dream.crop_h.to_f
      ratio_w = IMAGE_WIDTH / dream.crop_w.to_f
      height = IMAGE_HEIGHT
      left = dream.crop_x * ratio_h
      top = dream.crop_y * ratio_w
      "height: #{height}px; margin: #{-top}px 0 0 #{-left}px"
    else
      "height: #{IMAGE_HEIGHT}px"
    end
  end
end
