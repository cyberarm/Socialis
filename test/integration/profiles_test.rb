require 'test_helper'

class ProfilesTest < ActionDispatch::IntegrationTest
  test "User visit self.Profile --public" do
	User.create!(:username => "cyber", :email => "cyber@rails-test-app.com", :website => "http://github.com/cyberarm", :password => "secret", :password_confirm => "secret")
 # Login
	visit "/login"
	fill_in "Username", :with => "cyber"  
	fill_in "Password", :with => "secret"  
	click_button "Log in"
	follow_redirect!
	assert_contain "Logged in successfully." 
 # Test
	visit "/profiles/cyber"
	assert_contain "Cyber's Profile"
	assert_contain "Member since:"
	assert_contain "(This Is You)"
  end

  test "User visit steve's Profile --public" do
	User.create!(:username => "steve", :email => "cyber@rails-test-app.com", :website => "http://github.com/cyberarm", :password => "secret", :password_confirm => "secret")
	visit "/profiles/cyber"
	assert_contain "Cyber's Profile"
	assert_contain "Member since:"
  end

  test "User Profile --private" do
	User.create!(:username => "cyber", :email => "cyber@rails-test-app.com", :website => "http://github.com/cyberarm", :password => "secret", :password_confirm => "secret")
	visit "/login"
	fill_in "Username", :with => "cyber"  
	fill_in "Password", :with => "secret"  
	click_button "Log in"
	follow_redirect!
	assert_contain "Logged in successfully." 

	visit "/profile"
	assert_contain "This is your private profile Cyber"
  end
end
