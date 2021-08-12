require 'ffaker'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.count.zero?

categories = ['Mobile development', 'Photo', 'Web design', 'Web development'].map do |category_name|
  Category.find_or_create_by(name: category_name)
end

authors = FactoryBot.create_list(:author, 8)

users = FactoryBot.create_list(:user, 4)

books = Array.new(16) {
  FactoryBot.create(:book, category: categories.sample, authors: authors.sample(rand(1..3)))
}

16.times do
  FactoryBot.create(:review, :approved, book: books.sample, user: users.sample)
end

books.each do |book|
  rand(1..3).times { FactoryBot.create(:image, book: book) }
end
