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

  it 'displays all books' do
    books.each { |book| expect(current_page).to have_content(book.title.truncate(30)) }
  end

  describe 'when displays books with sort' do
    before do
      current_page.load(query: query)
    end

    describe "when displays with 'Newest first' sort" do
      let(:query) { { sort: I18n.t('sort.newest') } }

      it 'displays all books with sort' do
        sort_books = books.sort_by(&:created_at).reverse.map { |book| book.title.truncate(30) }
        expect(current_page.books.map { |book| book.title.text }).to eq(sort_books)
      end
    end

    describe "when displays with 'Popular first' sort" do
      let(:query) { { sort: I18n.t('sort.popular') } }

      it 'displays all books with sort' do
        sort_books = books.sort_by(&:created_at).map { |book| book.title.truncate(30) }
        expect(current_page.books.map { |book| book.title.text }).to eq(sort_books)
      end
    end

    describe "when displays with 'Price: Low to hight' sort" do
      let(:query) { { sort: I18n.t('sort.price_asc') } }

      it 'displays all books with sort' do
        sort_books = books.sort_by(&:price).map { |book| book.title.truncate(30) }
        expect(current_page.books.map { |book| book.title.text }).to eq(sort_books)
      end
    end

    describe "when displays with 'Price: Hight to low' sort" do
      let(:query) { { sort: I18n.t('sort.price_desc') } }

      it 'displays all books with sort' do
        sort_books = books.sort_by(&:price).reverse.map { |book| book.title.truncate(30) }
        expect(current_page.books.map { |book| book.title.text }).to eq(sort_books)
      end
    end
  end

  describe 'when displays books filter by category' do
    before do
      current_page.load(query: query)
    end

    describe 'when displays book with first category' do
      let(:query) { { filter: categories[0].id } }

      it 'displays books' do
        books_with_first_category.each { |book| expect(current_page).to have_content(book.title.truncate(30)) }
      end
    end

    describe 'when displays book with second category' do
      let(:query) { { filter: categories[1].id } }

      it 'displays books' do
        books_with_second_category.each { |book| expect(current_page).to have_content(book.title.truncate(30)) }
      end
    end
  end

  describe 'when show book' do
    it do
      current_page.books.first.img.hover
      current_page.books.first.show.click
      expect(current_page.current_url).to include('/books/')
    end
  end
end
