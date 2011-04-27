module ApplicationHelper
  def markdown(text)
  sanitize BlueCloth.new(text).to_html
  end
  
  def autolink(text)
    auto_link(text)
  end
end
