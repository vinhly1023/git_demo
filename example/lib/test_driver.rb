require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara/dsl'

class TestDriver
  def self.config_rspec_with_selenium
    RSpec.configure do |config|
      config.before(:all) do
        Capybara.register_driver :selenium do |app|
          profile = Selenium::WebDriver::Firefox::Profile.new
          profile.native_events = true #profile.native_events = false
          client = Selenium::WebDriver::Remote::Http::Default.new
          client.timeout = TimeOut::READTIMEOUT_CONST
          Capybara::Selenium::Driver.new(app, :profile => profile, :http_client => client)
        end
        Capybara.javascript_driver = :selenium
        Capybara.default_driver = :selenium # this can be changed to :selenium if you want to watch what's going on :webkit if not
        browser = Capybara.current_session.driver.browser
        Capybara.default_wait_time = TimeOut::WAIT_CONTROL_CONST
      end
    end
  end
end
