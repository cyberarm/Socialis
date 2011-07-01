module ApplicationHelper

  # Markdown
  def markdown(text)
   sanitize BlueCloth.new(text).to_html
  end

  # Automatically make text like this "http://github.com" a link (without the quotes)
  def autolink(text)
    auto_link(text, :html => { :target => '_blank' })
  end

  # random Greeting chosen each time a page is reloaded
  def greeting
   greetings = ["Hello", "Hey", "Greetings", "Salutations", "Welcome"]
   greetings[rand(greetings.size)]
  end
  
  # Version number
  def socialis_version
    "Socialis version: 0.0.0.70"
  end
  
  # Compares the Current Users Username to the ?.?
  def is_user?
current_user.username == @userl.username
  end
end


public
# capitalize the first character of a word or phrase
def first_capitalize
  mb_chars.capitalize.to_s
end
