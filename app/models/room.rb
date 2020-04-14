class Room < ApplicationRecord
    has_many :schedules
    
    validates :number, :name, presence: true
end
