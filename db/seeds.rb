# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning athletes database..."
Athlete.destroy_all
puts "Creating athletes..."
Athlete.create!(first_name: "Karim", last_name: "Benzema", price_per_day: 1000, age: 35, location: "Algerie", summary: "xxx" , features: "DZ", sport: "Football", user_id: 1 )
Athlete.create!(first_name: "Lebron", last_name: "James", price_per_day: 850, age: 37, location: "States", summary: "xxx" , features: "aaa", sport: "Basketball", user_id: 1 )
puts "Finished!"
