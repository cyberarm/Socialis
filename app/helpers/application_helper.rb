module ApplicationHelper
  def markdown(text)
  sanitize BlueCloth.new(text).to_html
  end
  
  def autolink(text)
    auto_link(text)
  end
  
  def socialis_version
    "Socialis version: 0.0.0.60"
  end

  def is_user?
current_user.username == @userl.username
  end
end

public
def first_capitalize
  mb_chars.capitalize.to_s
end
