module ApplicationHelper
  def markdown(text)
  sanitize BlueCloth.new(text).to_html
  # Markdown
  end
  
  def autolink(text)
    auto_link(text)
    # Automatically make text like this "http://github.com" a link (without the quotes)
  end
  
  def socialis_version
    "Socialis version: 0.0.0.62"
    # Version number
  end

  def is_user?
current_user.username == @userl.username
  end
end


public
def first_capitalize
  mb_chars.capitalize.to_s
  # capitalize the first character of a word or phrase
end
