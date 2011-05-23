require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  test "User valid Login" do
    User.create!(:username => "cyber", :email => "cyber@test-rails-app.com", :password => "secret")  
    visit "/login"
    fill_in "Username", :with => "cyber"  
    fill_in "Password", :with => "secret"  
    click_button "Log in"
    follow_redirect!
    assert_contain "Logged in successfully."  
  end
  test "User invalid Login" do
    User.create!(:username => "cyber", :email => "cyber@test-rails-app.com", :password => "secret")  
    visit "/login"
    fill_in "Username", :with => "bob"  
    fill_in "Password", :with => "secret"  
    click_button "Log in"  
    assert_contain "Invalid login or password."  
  end

test "User valid Signup" do
    visit "/signup"
    fill_in "Username", :with => "cyber" 
    fill_in "Email", :with => "cyber@rails-test-app.com" 
    fill_in "Password", :with => "Ubuntu-os"  
    fill_in "Confirm Password", :with => "Ubuntu-os"
    click_button "Sign up"  
    follow_redirect!
    assert_contain "Thank you for signing up! You are now logged in."  
  end
test "User invalid Signup" do
    visit "/signup"
    fill_in "Username", :with => "cyber" 
    fill_in "Email", :with => "cyberrails-test-app.com" 
    fill_in "Password", :with => "Ubuntu-os"  
    fill_in "Confirm Password", :with => "Ubuntu-os"
    click_button "Sign up"  
    assert_contain "Correct the following errors and try again."  
  end
end
