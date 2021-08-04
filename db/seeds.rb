require 'ffaker'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.count.zero?

categories = ['Mobile development', 'Photo', 'Web design', 'Web development'].map do |category_name|
  Category.find_or_create_by(name: category_name)
end
authors = Array.new(5) { Author.create!(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name) }
16.times do
  Book.create(title: FFaker::Book.title,
              price: rand(200.0),
              quantity: rand(1..10),
              description: FFaker::Book.description,
              year_of_publication: rand(1970..2020),
              height: rand(20.0),
              width: rand(20.0),
              depth: rand(10.0),
              materials: FFaker::AnimalUS.common_name,
              category: categories.sample,
              authors: authors.sample(1..3))
end
