Feature: Login

  Background: Login page
    Given I am on Login page

  Scenario: Succesful login
    Given I am on Login page
    When I fill up the register form
    Then I should see "Ваша учётная запись активирована. Вы можете войти."

