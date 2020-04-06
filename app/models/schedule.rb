class Schedule < ApplicationRecord
  belongs_to :room
  belongs_to :user, optional: true
  enum segment:[:'午前', :'午後'] 
  
  validates :date, uniqueness: { scope: [:segment, :room_id] }
end
