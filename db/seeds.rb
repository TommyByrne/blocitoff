require 'faker'

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
    name: Faker::Lorem.sentence
    )
end

puts "Seed Finished"
puts "#{List.count} lists created"
puts "#{Item.count} items created"