require 'faker'

#Create Users

5.times do
  user = User.new(
    name:   Faker::Name.name,
    email:  Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end

user = User.new(
name:   "Mr. Person",
email:  "person@example.com",
password: "password"
)
user.skip_confirmation!
user.save!

users = User.all

# Create Lists
10.times do
  List.create!(
    title: Faker::Lorem.sentence
    )
end
lists = List.all

# Create items
150.times do
  Item.create!(
    list: lists.sample,
    name: Faker::Lorem.sentence,
    duedate: Faker::Date.forward(39)
    )
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
