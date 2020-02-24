class Note < ApplicationRecord
	validates :name, :description, presence: true, allow_nil: false
end
