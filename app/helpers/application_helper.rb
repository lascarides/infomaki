# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def tree_select(categories, model, name, selected = nil, level = 0, init = true)
    html = ""
    # The "Root" option is added
    # so the user can choose a parent_id of 0
    if init
        # Add "Root" to the options
        html << "<select name=\"#{model}[#{name}]\" id=\"#{model}_#{name}\">\n"
        html << "\t<option value=\"0\""
        unless selected.nil?
          html << " selected=\"selected\"" if selected.parent_id == 0
        end
        html << ">Top Level</option>\n"
    end

    if categories.length > 0
      level += 1 # keep position
      categories.collect do |cat|
        html << "\t<option value=\"#{cat.id}\" style=\"padding-left:#{level * 10}px\""
        unless selected.nil?
          html << ' selected="selected"' if cat.id == selected.parent_id
        end
        html << ">#{cat.select_name}</option>\n"
        html << tree_select(cat.children, model, name, selected, level, false)
      end
    end
    html << "</select>\n" if init
    return html
  end

end
