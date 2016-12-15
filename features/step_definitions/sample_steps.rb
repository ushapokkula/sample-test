Given(/^I have gmail url$/) do
  visit Capybara.app_host
end

And(/^I see Username to enter$/) do
  sample_test.sample_page.username.should be_visible

end

When(/^I enter "([^"]*)" as username$/) do |data|
  sample_test.sample_page.username.set($data[data]['username'])

end

When(/^I enter "([^"]*)" as password$/) do |data|
  sample_test.sample_page.password.set($data[data]['password'])
end

And(/^I click "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I will be able to login successfully$/) do
  sample_test.sample_page.logout.should be_visible
end