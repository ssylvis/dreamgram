module ApplicationHelper
  def block_or_none(condition)
    condition ? 'display: block' : 'display: none'
  end

  def dismiss_button
    haml_tag :button, :type => "button", :class => "close", :"data-dismiss" => "alert" do
      haml_concat "&times;".html_safe
    end
  end

  def owned_by_account?(object)
    (object == current_account) || current_account.dreams.include?(object)
  end

  def page_title(page)
    title = t('layouts.title')
    page.present? ? "#{title} - #{page}" : title
  end
end
