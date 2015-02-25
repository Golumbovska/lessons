require 'selenium-webdriver'
load 'test_utils.rb'


driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

module Register
  set_user_name
  register
  login_2
end

module Changes
  change_password
end

module Project
  create_project
  add_member
end

module Projectchanges
  chande_roles
  version_1
  version_2
  version_3
end