require 'selenium-webdriver'
load 'test_utils.rb'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

def set_user_name(driver, login)
  driver.find_element(class: 'register').click
  driver.find_element(id: 'user_login').send_keys login
  driver.find_element(id: 'user_password').send_keys 'golumbovska1234'
  driver.find_element(id: 'user_password_confirmation').send_keys 'golumbovska1234'
  driver.find_element(id: 'user_firstname').send_keys 'Nastya'
  driver.find_element(id: 'user_lastname').send_keys 'Golumbovska'
  driver.find_element(id: 'user_mail').send_keys login + '@mail.com'
  driver.find_element(name: 'commit').click
  driver.find_element(class: 'logout').click

end

def register(driver, login)
  driver.find_element(class: 'register').click
  driver.find_element(id: 'user_login').send_keys login
  driver.find_element(id: 'user_password').send_keys 'golumbovska1234'
  driver.find_element(id: 'user_password_confirmation').send_keys 'golumbovska1234'
  driver.find_element(id: 'user_firstname').send_keys 'Nastya'
  driver.find_element(id: 'user_lastname').send_keys 'Golumbovska'
  driver.find_element(id: 'user_mail').send_keys login + '@mail.com'
  driver.find_element(name: 'commit').click
end



def login_2(driver, login)
 driver.find_element(class: 'logout').click
 driver.find_element(class: 'login').click
 driver.find_element(id:'username').send_keys login
 driver.find_element(id:'password').send_keys 'golumbovska1234'
 driver.find_element(name:'login').click
 end
 login1 = 'golumbovska' + random_string(8)
 login2 = 'golumbovska' + random_string(8)

 set_user_name(driver, login1)
 register(driver, login2)
 login_2(driver, login1)

def change_password(driver)
 driver.find_element(class:'my-account').click
 driver.find_element(class: 'icon-passwd').click
 sleep 2
 driver.find_element(id: 'password').send_keys 'golumbovska1234'
 driver.find_element(id: 'new_password').send_keys '1234golumbovska'
 driver.find_element(id:'new_password_confirmation').send_keys '1234golumbovska'
 driver.find_element(name: 'commit').click
end

 change_password(driver)

def create_project (driver)
 driver.find_element(class: 'projects').click
 driver.find_element(class: 'icon-add').click
 sleep 2
 driver.find_element(id: 'project_name').send_keys 'flamfelis'
 driver.find_element(id: 'project_description').send_keys 'aynenenenene'
 driver.find_element(id: 'project_identifier').send_keys random_string(10)
 driver.find_element(name: 'continue').click
end

def add_member(driver, login)
 driver.find_element(:xpath, ".//*[@id='project_quick_jump_box']/option[3]").click
 driver.find_element(class:'settings').click
 driver.find_element(id: 'tab-members').click
 driver.find_element(:xpath, "//input[@id='principal_search']").send_keys login
 sleep 2
 driver.find_element(:xpath, "//input[@name='membership[user_ids][]'][1]" ).click
 driver.find_element(:xpath, "//label[.=' Manager']/input").click
 driver.find_element(id:'member-add-submit').click
end


create_project(driver)
add_member(driver, login2)


def chande_roles(driver)
 sleep 2
 driver.find_element(css: 'a.icon.icon-edit').click
 driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[1]" ).click
 driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[2]" ).click
 driver.find_element(class: 'small').click
end

def version_1(driver)
 driver.find_element(id: 'tab-versions').click
 driver.find_element(class: 'icon-add').click
 driver.find_element(id:'version_name').send_keys 'ksenofont'
 driver.find_element(:xpath, ".//*[@id='version_status']/option[1]").click
 driver.find_element(name:'commit').click
end

def version_2(driver)
 driver.find_element(class: 'icon-add').click
 driver.find_element(id:'version_name').send_keys 'ksenofontiha'
 driver.find_element(:xpath, ".//*[@id='version_status']/option[2]").click
 driver.find_element(name:'commit').click
end

def version_3(driver)
driver.find_element(class: 'icon-add').click
driver.find_element(id:'version_name').send_keys 'ksenofontihan'
sleep 2
driver.find_element(:xpath, ".//*[@id='version_status']/option[3]").click
driver.find_element(name:'commit').click
end

chande_roles(driver)
version_1(driver)
version_2(driver)
version_3(driver)




fail 'Expected message did not meet' unless driver.find_element(id: 'flash_notice').text == 'Your account has been activated. You can now log in.asdf'
