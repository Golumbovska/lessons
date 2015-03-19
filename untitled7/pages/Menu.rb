class Menu
  include PageObject


  button :logoutBtn, :class => 'logout'
  button :register, :class => 'register'
  button :loginBtn, :class => 'login'

  def logout (data = {})
    self.logoutBtn
  end

  def to_register_page (data = {})
    self.register
  end

  def login_user (data = {})
    self.loginBtn
  end

end