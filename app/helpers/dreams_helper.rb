module DreamsHelper
  def dream_tab(state, current)
    if state == current
      haml_tag :li, :class => 'active' do
        haml_concat dream_link state
      end
    else
      haml_tag :li do
        haml_concat dream_link state
      end
    end
  end

private

  def dream_link(state)
    path_options = params.slice(:edit).merge(:state => state)
    link_to state.to_s.humanize, dreams_path(path_options)
  end
end
