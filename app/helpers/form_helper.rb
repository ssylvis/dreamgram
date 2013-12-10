module FormHelper
  def error_for(model, field)
    if model && model.errors[field].present?
      haml_tag :span, :class => 'help-block' do
        haml_concat "#{full_message_for(model, field)}"
      end
    end
  end

  def form_group_for(model, field)
    classes =
      if model && model.errors[field].present?
        'form-group has-error'
      else
        'form-group'
      end
    haml_tag :div, :class => "#{classes}" do
      yield
    end
  end

private

  def full_message_for(model, field)
    (model.errors[field] || []).map { |m| model.errors.full_message(field, m) }.first
  end
end
