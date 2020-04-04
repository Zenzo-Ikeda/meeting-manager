# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

start_day = Date.today.end_of_month + 1
last_day = start_day.end_of_month

(start_day..last_day).each do |day|
    Schedule.create(date: day, segment: 0,room_id: 1)
    Schedule.create(date: day, segment: 1,room_id: 1)
    Schedule.create(date: day, segment: 0,room_id: 2)
    Schedule.create(date: day, segment: 1,room_id: 2)
end 

    
