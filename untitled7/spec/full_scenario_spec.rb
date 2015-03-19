require 'spec_helper'
require_relative '../pages/register_page'
require_relative '../pages/my_account_page'

describe "Full Scenario",:external do
  describe "Registation Flow" do
    context 'after successful registation' do
      before :all do
        visit(RegisterPage).register_as('ififkggkjkllfdggeffioefjjk')
        on(MyAccountPage).wait_until {|page| @current_page.text.include? 'My account'}
      end
      it_behaves_like 'current url include', 'my/account'
      it_behaves_like 'has flash notice', 'Ваша учётная запись активирована. Вы можете войти.'

      describe "user"  do

        it 'should be logged in' do
         expect(@current_page.text). to include 'Logged in'

        end

    end


    end
  end

  describe "Login Flow" do
    context 'after logout' do
      before :all do
        on(Menu).logout
      end



    end



  end

  describe "Logout Flow" do
    it 'should be logout' do
      expect(@current_page.text). to include 'demo.redmine.org'
    end


  end

  describe "Change p"
end