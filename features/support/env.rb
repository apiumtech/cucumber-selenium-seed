require 'selenium/webdriver'
require 'headless'

headless = Headless.new
headless.start
browser = Selenium::WebDriver.for :chrome

Before do |scenario|
  @browser = browser
end

at_exit do
  browser.quit
  headless.destroy
end
