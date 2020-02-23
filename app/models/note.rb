class Note < ApplicationRecord
	validates :name, :description, presence: true
end
