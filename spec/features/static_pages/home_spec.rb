# frozen_string_literal: true

RSpec.describe 'Home > Home', type: :feature, js: true do
  let(:current_page) { Home.new }
  let(:order) { create(:order, status: 4) }
  let!(:order_items) { Array.new(StaticPagesController::BOOKS_COUNT) { create(:order_item, order: order) } }

  before do
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  it 'redirect to catalog' do
    current_page.start.click
    expect(current_page.current_url).to end_with('/books')
  end

  it { expect(current_page.latests.count).to eq StaticPagesController::BOOKS_COUNT }
  it { expect(current_page.bestsellers.count).to eq StaticPagesController::BOOKS_COUNT }

  it 'show books' do
    order_items.each do |order_item|
      expect(current_page).to have_content order_item.book.title
    end
  end
end
