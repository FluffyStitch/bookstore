# frozen_string_literal: true

RSpec.describe 'Book > Index', type: :feature, js: true do
  let(:current_page) { Catalog.new }
  let(:books_with_first_category) { create_list(:book, rand(2..4), category: categories[0]) }
  let(:books_with_second_category) { create_list(:book, rand(2..4), category: categories[1]) }
  let!(:categories) { create_list(:category, 2) }
  let!(:books) { books_with_first_category + books_with_second_category }

  before do
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  it 'displays all categories' do
    categories.each { |category| expect(current_page).to have_content(category.name) }
  end

  it 'displays books' do
    books.each { |book| expect(current_page).to have_content(book.title) }
  end

  it 'redirect to book page' do
    current_page.books.first.img.hover
    current_page.books.first.show.click
    expect(current_page.current_url).to include('/books/')
  end

  it 'add book to cart' do
    current_page.books.first.img.hover
    current_page.books.first.shop.click
    expect(current_page).to have_content I18n.t(:book_added)
  end

  describe 'when click view more button' do
    let!(:books) { create_list(:book, rand(13..18)) }

    it 'displays not all books before click' do
      expect(current_page.books.count).not_to eq(books.count)
    end

    it 'displays all books after click' do
      current_page.view_more.click
      current_page.wait_until_view_more_invisible
      expect(current_page.books.count).to eq(books.count)
    end
  end
end
