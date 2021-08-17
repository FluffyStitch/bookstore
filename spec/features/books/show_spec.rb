# frozen_string_literal: true

RSpec.describe 'Book > Show', type: :feature, js: true do
  let(:current_page) { BookPage.new }
  let(:category) { create(:category) }
  let!(:book) { create(:book, category: category) }
  let!(:review) { create(:review, book: book, status: 1) }
  let!(:user) { create(:user) }

  before do
    current_page.load(id: book.id)
  end

  it { expect(current_page).to be_displayed }

  it { expect(current_page).to have_selector("img[src$='.png']") }

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

  describe 'create reviews' do
    before do
      sign_in user
      current_page.load(id: book.id)
      current_page.stars[rand(0..4)].click
      current_page.form.title.fill_in(with: attributes[:title])
      current_page.form.text.fill_in(with: attributes[:text])
      current_page.form.post.click
    end

    context 'when params is valid' do
      let(:attributes) { attributes_for(:review) }

      it 'success' do
        expect(current_page).to have_content I18n.t(:review_posted)
      end
    end

    context 'when params is invalid' do
      let(:attributes) { attributes_for(:review, title: '') }

      it 'success' do
        expect(current_page).to have_content I18n.t('errors.messages.blank')
      end
    end
  end

  describe 'show reviews' do
    it { expect(current_page).to have_content review.text }
  end
end
