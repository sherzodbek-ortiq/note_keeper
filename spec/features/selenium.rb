require 'rails_helper'

	driver = Selenium::WebDriver.for :firefox
	driver.navigate.to "127.0.0.1:3000"

	wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
	wait.until { driver.find_element(name: 'name') }
	element = driver.find_element(name: 'name')
	element.send_keys "Hello WebDriver!"
	element.submit
	driver.save_screenshot("./screen.png")
