module RecipesHelper

  def pretty_text_field(f, field)
    content_tag(:div) do |content|
      f.label(field) + ' ' + f.text_field(field) 
    end
  end
end
