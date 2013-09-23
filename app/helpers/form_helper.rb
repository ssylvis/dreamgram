module FormHelper
  def control_group_for(model, field)
    classes =
      if model && model.errors[field].present?
        'control-group error'
      else
        'control-group'
      end
    haml_tag :div, :class => "#{classes}" do
      yield
    end
  end

  def error_for(model, field)
    if model && model.errors[field].present?
      haml_tag :span, :class => 'help-inline' do
        haml_concat "#{full_message_for(model, field)}"
      end
    end
  end

private

  def full_message_for(model, field)
    (model.errors[field] || []).map { |m| model.errors.full_message(field, m) }.first
  end
end
