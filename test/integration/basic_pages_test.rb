require 'test_helper'

class BasicPagesTest < ActionDispatch::IntegrationTest
  test "Home" do
 # validates presence of Home page
	visit "/"
	assert_contain "Latest Statuses:"
	assert_contain "Latest Users:"
  end

  test "About" do
 # validates presence of About page
	visit "/about"
	assert_contain "About Socialis"
	assert_contain "Socialis Stats:"
  end

   test "Users" do
 # validates presence of Users page
	visit "/users"
	assert_contain "Our Users"
  end

   test "Help" do
 # validates presence of Help page
	visit "/help"
	assert_contain "Need Help With Socialis?"
	assert_contain "Q: How do I change my profile picture?"
  end

  test "Version" do
 # validates presence of Version page
	visit "/version.json"
	assert_contain "0.0.0.65"
  end
end
