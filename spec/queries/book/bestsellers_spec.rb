# frozen_string_literal: true

RSpec.describe Book::Bestsellers do
  describe '.call' do
    subject(:bestsellers) { described_class.call }

    let(:category) { create(:category) }
    let(:bestseller) { create(:book, category: category) }
    let(:book) { create(:book, category: category) }

    before do
      create_list(:order_item, 2, book: bestseller, order: create(:order, status: 5))
      create(:order_item, book: book, order: create(:order, status: 5))
    end

    it { is_expected.to eq [bestseller] }
    it { is_expected.not_to eq [book] }
  end
end
