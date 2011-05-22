require 'test_helper'

class BasicPagesTest < ActionDispatch::IntegrationTest
  test "Home" do
	visit "/"
	assert_contain "Latest Statuses:"
	assert_contain "Latest Users:"
  end

  test "About" do
	visit "/about"
	assert_contain "About Socialis"
	assert_contain "Socialis Stats:"
  end

   test "Users" do
	visit "/users"
	assert_contain "Our Users"
  end

   test "Help" do
	visit "/help"
	assert_contain "Need Help With Socialis?"
	assert_contain "Q: How do I change my profile picture?"
  end
end
