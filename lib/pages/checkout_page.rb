require 'page-object'

class RegisterPage
  include PageObject
  include DataMagic

  text_field :login, :id => 'user_login'
  text_field :password, :id => 'user_password'
  text_field :confirmation, :id => 'user_password_confirmation'
  text_field :name, :id => 'user_firstname'
  text_field :last_name, :id => 'user_lastname'
  text_field :email, :id => 'user_mail'



  def register (user = {})
    populate_page_with data_for :checkoutpage, user
    commit
  end


end