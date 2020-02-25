require 'rails_helper'

RSpec.feature "Forms", type: :feature do

	before(:all) do
		@driver = Selenium::WebDriver.for :firefox
		@wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
	end

	after(:all) do
		@driver.quit
	end

	describe "GET root" do

		context "when loaded page first time" do
	
			it "should have title" do
				visit root_path
				expect(page).to have_title("NoteKeeper")
			end

		end

	end

	describe "POST #create" do

		context "when invalid" do

			it "should have error message" do
				@driver.manage.window.resize_to(300, 600)
				@driver.manage.window.move_to(300, 400)
				@driver.navigate.to "http://localhost:3000"
				@wait.until { @driver.find_element(name: 'name') }
				note_name = @driver.find_element(name: 'name')
				note_description = @driver.find_element(name: 'description')
				note_name.send_keys "name1"
				note_description.send_keys ""
				note_name.submit
				@driver.save_screenshot("./spec/fixtures/selenium_screenshots/screenshot.png")
				note_error = @driver.find_element(id: "note-error")
				expect(note_error.text).to eql("Error has occured")
			end

		end

		context "when valid" do
	
			it "should not have error message" do
				@driver.manage.window.resize_to(400, 700)
				@driver.manage.window.move_to(300, 400)
				@driver.navigate.to "http://localhost:3000"
				@wait.until { @driver.find_element(name: 'name') }
				note_name = @driver.find_element(name: 'name')
				note_description = @driver.find_element(name: 'description')
				note_name.send_keys "name1"
				note_description.send_keys "description1"
				note_name.submit
				note_error = @driver.find_element(id: "note-error")

				expect(note_error.text).to eql("")
			end

		end

	end

	describe "PATCH #update" do

		context "when invalid" do

			it "should not have error message" do
				@driver.navigate.to "http://localhost:3000"
				@wait.until { @driver.find_elements(class: 'note') }
				notes = @driver.find_elements(class: 'note')
				note = notes[0]
				edit_button = note.find_element(class: "edit-button")
				edit_button.click
				submit_button = edit_button
				note_name = note.find_element(name: 'name')
				note_description = note.find_element(name: 'description')
				note_name.send_keys "name1"
				note_description.send_keys "description1"
				submit_button.click
				note_error = @driver.find_element(id: "note-error")

				expect(note_error.text).to eql("")
			end

		end

		context "when invalid" do

			it "should have error message" do
				@driver.navigate.to "http://localhost:3000"
				@wait.until { @driver.find_elements(class: 'note') }
				notes = @driver.find_elements(class: 'note')
				note = notes[0]
				edit_button = note.find_element(class: "edit-button")
				edit_button.click
				submit_button = edit_button
				note_name = note.find_element(name: 'name')
				note_description = note.find_element(name: 'description')
				note_name.send_keys "name1"
				note_description.send_keys ""
				submit_button.click
				note_error = @driver.find_element(id: "note-error")

				expect(note_error.text).to eql("")
			end

		end

	end

	describe "DELETE #destroy" do

		context "when invalid" do

			it "should delete" do
				@driver.navigate.to "http://localhost:3000"
				@wait.until { @driver.find_elements(class: 'note') }
				notes = @driver.find_elements(class: 'note')
				note = notes[0]
				note_count_before = notes.count
				delete_button = note.find_element(class: "delete-button")
				delete_button.click
				@wait
				notes = @driver.find_elements(class: 'note')
				note_count_after = notes.count

				expect(note_count_before).to eql(note_count_after + 1)
			end

		end

	end
			
end

#puts "/////////////////////////////"
#puts notes[0]
#puts "/////////////////////////////"
