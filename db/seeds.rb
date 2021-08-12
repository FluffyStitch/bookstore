require 'ffaker'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.count.zero?

categories = ['Mobile development', 'Photo', 'Web design', 'Web development'].map do |category_name|
  Category.find_or_create_by(name: category_name)
end
authors = Array.new(5) { Author.create!(first_name: FFaker::Name.first_name, second_name: FFaker::Name.last_name) }
books = Array.new(16) {
  Book.create!(title: FFaker::Book.title,
              price: rand(200.0),
              quantity: rand(1..10),
              description: FFaker::Book.description,
              year_of_publication: rand(1970..2020),
              height: rand(20.0),
              width: rand(20.0),
              depth: rand(10.0),
              materials: FFaker::AnimalUS.common_name,
              category: categories.sample,
              authors: authors.sample(rand(1..3)))
  }
users = Array.new(3) { User.create!(email: FFaker::Internet.email, password: (Array.new(7) { ('a'..'z').to_a.sample } << ('0'..'9').to_a.sample).join.capitalize) }
16.times do
  Review.create(book_id: books.sample.id,
                user_id: users.sample.id,
                title: FFaker::AnimalUS.common_name,
                text: FFaker::Book.description,
                status: 1,
                score: rand(1..5))
end
