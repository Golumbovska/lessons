require 'rspec'
require 'page-object'
require 'watir-webdriver' #only here require
#include all using gems
#include PageObject module in each PageClass, include is only in clases and modules
#require_relative in spec files (our page class files)
RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before :all do #:each,
    @browser = Watir::Browser.new :firefox
    @browser.window.maximize
  end
  config.around :example do |example|
#when before and after are not enough
#just checking, no action in examples
  end

  config.after :all do
    @browser.close
  end
end

shared_examples 'current url include' do |message|
    it "#{message}" do
      expect(@current_page.current_url).to include message
    end
end

shared_examples 'has flash notice' do |message|
    it "with message #{message}" do
     expect(@current_page.flash_notice).to include message
    end
end

@name