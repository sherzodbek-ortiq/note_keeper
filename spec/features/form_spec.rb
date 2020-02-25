require 'rails_helper'

RSpec.feature "Forms", type: :feature do
	describe "GET root" do

		context "" do
	
			it "should have title" do
				visit root_path
				expect(page).to have_title("NoteKeeper")
			end

			it "should have form" do

				driver = Selenium::WebDriver.for :firefox
				driver.navigate.to "http://localhost:3000"

				wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
				wait.until { driver.find_element(name: 'name') }
				name = driver.find_element(name: 'name')
				element.send_keys "Hello WebDriver!"
				element.submit
				driver.save_screenshot("./screen.png")

				visit root_path
				expect(page).to have_title("NoteKeeper")
			end
	
		end
			
	end
end
