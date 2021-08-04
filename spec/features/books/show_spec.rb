# frozen_string_literal: true

RSpec.describe 'Book > Show', type: :feature, js: true do
  let(:current_page) { BookPage.new }
  let(:category) { create(:category) }
  let!(:book) { create(:book, category: category) }

  before do
    current_page.load(id: book.id)
  end

  it { expect(current_page).to be_displayed }

  describe 'when change count' do
    it 'plus' do
      current_page.plus.click
      expect(current_page.price.text).to eq(I18n.t(:price, money: book.price * 2))
    end

    it 'minus' do
      current_page.plus.click
      current_page.minus.click
      expect(current_page.price.text).to eq(I18n.t(:price, money: book.price))
    end

    it 'does not minus' do
      current_page.minus.click
      expect(current_page.price.text).to eq(I18n.t(:price, money: book.price))
    end
  end

  describe 'when click read more' do
    before do
      current_page.read_more.click
    end

    it 'visible all description' do
      expect(current_page).to have_content(book.description)
    end

    it 'hide read more button' do
      expect(current_page).not_to have_content(I18n.t('book.read_more'))
    end
  end
end
