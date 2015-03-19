

class RegisterPage
  include PageObject

  page_url 'http://demo.redmine.org/account/register'
  text_field :login, id: 'user_login'
  text_field :password, id: 'user_password'
  text_field :confirmation, id: 'user_password_confirmation'
  text_field :firstname, id: 'user_firstname'
  text_field :last_name, id: 'user_lastname'
  text_field :email, id: 'user_mail'
  button :commit, name: 'commit'

  def register_as(login)
    self.login = login
    self.password = 'dsca'
    self.confirmation = 'dsca'
    self.firstname = login
    self.last_name = login
    self.email = login + '@dkdk.co'
    self.commit
  end

end

