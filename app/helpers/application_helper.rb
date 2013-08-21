module ApplicationHelper
  def page_title(page)
    page.present? ? "Dreamgram - #{page}" : 'Dreamgram'
  end
end
