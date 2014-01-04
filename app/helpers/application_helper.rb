module ApplicationHelper
  def page_title(page)
    title = t('layouts.title')
    page.present? ? "#{title} - #{page}" : title
  end
end
