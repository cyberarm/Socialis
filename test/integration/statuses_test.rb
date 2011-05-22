require 'test_helper'

class StatusesTest < ActionDispatch::IntegrationTest
  test "Create valid Status" do
    User.create!(:username => "cyber", :email => "cyber@test-rails-app.com", :password => "secret")
    visit "/login"
    fill_in "Username", :with => "cyber"
    fill_in "Password", :with => "secret"
    click_button "Log in"
    follow_redirect!
    assert_contain "Logged in successfully."

    visit "/status/new"
    fill_in "message", :with => "Test"
    fill_in "author", :with => "cyber"
    click_button "Post Status"
    follow_redirect!
    assert_contain "Status Saved"
  end
  test "Create invalid Status" do
    User.create!(:username => "cyber", :email => "cyber@test-rails-app.com", :password => "secret")
    visit "/login"
    fill_in "Username", :with => "cyber"
    fill_in "Password", :with => "secret"
    click_button "Log in"
    follow_redirect!
    assert_contain "Logged in successfully."

    visit "/status/new"
    fill_in "message", :with => ""
    fill_in "author", :with => "cyber"
    click_button "Post Status"
    follow_redirect!
    assert_contain "Status failed to save."
  end

  test "Try to Create Status without Logging in" do
    visit "/status/new"
    follow_redirect!
    assert_contain "You must first log in or sign up before accessing this page."
  end
end
