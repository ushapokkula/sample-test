require 'capybara/cucumber'
require 'cucumber'
require 'site_prism'
require 'rspec'
require 'selenium-webdriver'
require 'faker'
require 'yaml'
require 'fileutils'
require 'require_all'
require_relative 'world'
#require 'capybara/poltergeist'
#require 'report_builder'


require_all File.dirname(__FILE__)+ '/../../sample_test/pages'
require_relative '../../sample_test/utilities/misc'
include Utilities::Misc

#config = load_yaml_file('environment')
$data = load_yaml_file('data')

@url= "http://www.gmail.com"

# choose a driver, if its not given, then default is firefox
if ENV['DRIVER'] == nil
  Capybara.default_driver = :firefox
elsif ENV['DRIVER'] == 'headless'
  Capybara.default_driver = :poltergeist
else
  Capybara.default_driver = ENV['DRIVER'].to_sym
end

#capybara configuration
Capybara.configure do |config|
  config.default_max_wait_time = 50
  config.app_host = @url
  config.ignore_hidden_elements = false
end

#driver registrations
Capybara.register_driver :firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.native_events = true
  Capybara::Selenium::Driver.new(app)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :ie do |app|
  Capybara::Selenium::Driver.new(app, :browser => :ie)
end

Capybara.register_driver :debug do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.add_extension "features/support/firebug.xpi"
  profile.add_extension "features/support/firepath.xpi"
Capybara::Selenium::Driver.new app, :profile => profile
end




# tell site-prism to use capybara implicit waits
SitePrism.configure do |config|
  config.use_implicit_waits = true
end

World(TestWorld)







