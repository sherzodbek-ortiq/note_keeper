FactoryBot.define do
	factory :note, class: "Note" do
		name {Faker::Name.first_name}
		description {"Description1"}
	end	
end