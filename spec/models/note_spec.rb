require 'rails_helper'

RSpec.describe Note, type: :model do

	before(:all) do
		@note = create(:note) # using factory_bot_rails
	end

	after(:all) do
		@note.destroy
	end

	describe ".create" do

		context "when note name and description are empty" do
			let (:note) {Note.new} # let block is run only when the variable is called, before(:each) block is run whenever exaple is run
	
			it "should not be valid" do
				expect(note.valid?).to be false
			end
	
			it "should not save" do
				expect(note.save).to be false
			end
		end
	
		context "when note name and description are not empty" do
			let (:note) {Note.new(name: "Name2", description:"Descripttion2")}
	
			it "should be valid" do
				expect(note.valid?).to be true
			end
	
			it "should save" do
				expect(note.save).to be true
			end
		end
	
	end

	describe "#update" do

		context "when note name is changed" do
			it "should be different" do
				old_name = @note.name
				@note.update(name:"Name3")
				expect(@note.name).not_to eql(old_name)
			end
		end

	end

end
