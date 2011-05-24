module ApplicationHelper
  def markdown(text)
  sanitize BlueCloth.new(text).to_html
  # Markdown
  end
  
  def autolink(text)
    auto_link(text, :html => { :target => '_blank' })
    # Automatically make text like this "http://github.com" a link (without the quotes)
  end

  def greeting
   greetings = ["Hello", "Hey", "Greetings", "Salutations", "Welcome"]
   greetings[rand(greetings.size)]
  end
  
  def socialis_version
    "Socialis version: 0.0.0.65"
    # Version number
  end
  
  def version
    '0.0.0.65'
	# called when visiting: /version.json
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
