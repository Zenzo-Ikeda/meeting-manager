class Schedule < ApplicationRecord
  belongs_to :room
  belongs_to :user, optional: true
  enum segment:[:'午前', :'午後'] 
end
