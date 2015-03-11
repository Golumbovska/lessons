require 'selenium-webdriver'
require 'cucumber'
require_relative '../../../lib/pages/checkout_page'
require_relative '../../../lib/pages/homepage'



Given(/^I am on Login page$/) do
  visit LoginPage
end


When(/^I fill up the register form$/) do
  on(RegisterPage).register
end

Then(/^I should see "([^"]*)"$/) do |message|
  @current_page.must_include message
end