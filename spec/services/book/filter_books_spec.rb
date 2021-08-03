# frozen_string_literal: true

RSpec.describe Book::FilterBooks do
  subject(:filter_books) { described_class.new(params).call }

  let(:categories) { create_list(:category, 2) }
  let(:books_with_first_category) { create_list(:book, rand(3..6), category: categories[0]) }
  let(:books_with_second_category) { create_list(:book, rand(3..6), category: categories[1]) }
  let!(:books) { books_with_first_category + books_with_second_category }

  describe 'when displays books with sort' do
    describe "when displays with 'Newest first' sort" do
      let(:params) { { sort: I18n.t('sort.newest') } }

      it 'displays all books with sort' do
        sort_books = books.sort_by(&:created_at).reverse
        expect(filter_books).to eq(sort_books)
      end
    end

    describe "when displays with 'Popular first' sort" do
      let(:params) { { sort: I18n.t('sort.popular') } }

      it 'displays all books with sort' do
        sort_books = books.sort_by(&:created_at)
        expect(filter_books).to eq(sort_books)
      end
    end

    describe "when displays with 'Price: Low to hight' sort" do
      let(:params) { { sort: I18n.t('sort.price_asc') } }

      it 'displays all books with sort' do
        sort_books = books.sort_by(&:price)
        expect(filter_books).to eq(sort_books)
      end
    end

    describe "when displays with 'Price: Hight to low' sort" do
      let(:params) { { sort: I18n.t('sort.price_desc') } }

      it 'displays all books with sort' do
        sort_books = books.sort_by(&:price).reverse
        expect(filter_books).to eq(sort_books)
      end
    end
  end

  describe 'when displays books filter by category' do
    describe 'when displays book with first category' do
      let(:params) { { filter: categories[0].id } }

      it 'displays books' do
        expect(filter_books).to match_array(books_with_first_category)
      end
    end

    describe 'when displays book with second category' do
      let(:params) { { filter: categories[1].id } }

      it 'displays books' do
        expect(filter_books).to match_array(books_with_second_category)
      end
    end
  end
end
