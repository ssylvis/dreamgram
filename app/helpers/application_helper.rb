module ApplicationHelper
  def dismiss_button
    haml_tag :button, :type => "button", :class => "close", :"data-dismiss" => "alert" do
      haml_concat "&times;".html_safe
    end
  end

  def owned_by_account?(account)
    account == current_account
  end

  def page_title(page)
    title = t('layouts.title')
    page.present? ? "#{title} - #{page}" : title
  end
end
