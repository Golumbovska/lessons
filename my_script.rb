require 'selenium-webdriver'
load 'test_utils.rb'


driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

login1 = 'golumbovska' + random_string(8)
driver.find_element(class: 'register').click
driver.find_element(id: 'user_login').send_keys login1
driver.find_element(id: 'user_password').send_keys 'golumbovska1234'
driver.find_element(id: 'user_password_confirmation').send_keys 'golumbovska1234'
driver.find_element(id: 'user_firstname').send_keys 'Nastya'
driver.find_element(id: 'user_lastname').send_keys 'Golumbovska'
driver.find_element(id: 'user_mail').send_keys login1 + '@mail.com'
driver.find_element(name: 'commit').click

driver.find_element(class: 'logout').click

login2 = 'golumbovska' + random_string(8)
driver.find_element(class: 'register').click
driver.find_element(id: 'user_login').send_keys login2
driver.find_element(id: 'user_password').send_keys 'golumbovska1234'
driver.find_element(id: 'user_password_confirmation').send_keys 'golumbovska1234'
driver.find_element(id: 'user_firstname').send_keys 'Nastya'
driver.find_element(id: 'user_lastname').send_keys 'Golumbovska'
driver.find_element(id: 'user_mail').send_keys login2 + '@mail.com'
driver.find_element(name: 'commit').click

driver.find_element(class: 'logout').click

driver.find_element(class: 'login').click
driver.find_element(id:'username').send_keys login1
driver.find_element(id:'password').send_keys 'golumbovska1234'
driver.find_element(name:'login').click

driver.find_element(class:'my-account').click

#change password
driver.find_element(class: 'icon-passwd').click
sleep 2
driver.find_element(id: 'password').send_keys 'golumbovska1234'
driver.find_element(id: 'new_password').send_keys '1234golumbovska'
driver.find_element(id:'new_password_confirmation').send_keys '1234golumbovska'
driver.find_element(name: 'commit').click

driver.find_element(class: 'projects').click

driver.find_element(class: 'icon-add').click
sleep 2
driver.find_element(id: 'project_name').send_keys 'flamfelis'
driver.find_element(id: 'project_description').send_keys 'aynenenenene'
driver.find_element(id: 'project_identifier').send_keys random_string(10)
driver.find_element(name: 'continue').click


driver.find_element(:xpath, ".//*[@id='project_quick_jump_box']/option[3]").click


driver.find_element(class:'settings').click
driver.find_element(id: 'tab-members').click
driver.find_element(:xpath, "//input[@id='principal_search']").send_keys login2
sleep 2
driver.find_element(:xpath, "//input[@name='membership[user_ids][]'][1]" ).click
driver.find_element(:xpath, "//label[.=' Manager']/input").click
driver.find_element(id:'member-add-submit').click

sleep 3
driver.find_element(css: '.icon-edit:first').click #не работает
driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[1]" ).click
driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[2]" ).click
driver.find_element(class: 'commit').click


driver.find_element(id: 'tab-versions').click
driver.find_element(class: 'icon-add').click
driver.find_element(id:'version_name').send_keys 'ksenofont'
driver.find_element(:xpath, ".//*[@id='version_status']/option[2]").click
driver.find_element(name:'commit').click

driver.find_element(class: 'icon-add').click
driver.find_element(id:'version_name').send_keys 'ksenofontiha'
driver.find_element(:xpath, ".//*[@id='version_status']/option[3]").click
driver.find_element(name:'commit').click

driver.find_element(class: 'icon-add').click
driver.find_element(id:'version_name').send_keys 'ksenofontiha'
driver.find_element(:xpath, ".//*[@id='version_status']/option[4]").click
driver.find_element(name:'commit').click

#последний пункт в разработке




fail 'Expected message did not meet' unless driver.find_element(id: 'flash_notice').text == 'Your account has been activated. You can now log in.asdf'
