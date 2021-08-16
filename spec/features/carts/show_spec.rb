# frozen_string_literal: true

RSpec.describe 'Cart > Show', type: :feature, js: true do
  let(:current_page) { CartPage.new }
  let(:cart) { user.create_current_order }
  let!(:order_item) { cart.order_items.create(params) }
  let(:user) { create(:user) }
  let(:params) { attributes_for(:order_item, quantity: 1) }

  before do
    sign_in user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'when change count' do
    it 'plus' do
      current_page.order_items.first.plus.click
      current_page.load
      expect(current_page.order_total.text).to eq(I18n.t(:price, money: order_item.book.price * 2))
    end

    it 'minus' do
      current_page.order_items.first.plus.click
      current_page.load
      current_page.order_items.first.minus.click
      current_page.load
      expect(current_page.order_total.text).to eq(I18n.t(:price, money: order_item.book.price))
    end

    it 'does not minus' do
      current_page.order_items.first.minus.click
      current_page.load
      expect(current_page.order_total.text).to eq(I18n.t(:price, money: order_item.book.price))
    end
  end

  describe 'when delete order item' do
    it 'delete' do
      current_page.order_items.first.delete.click
      current_page.load
      expect(current_page.order_total.text).to eq(I18n.t(:price, money: 0.0))
    end
  end

  describe 'when add coupon' do
    let(:coupon) { create(:coupon) }
    let(:discount) { (order_item.book.price * coupon.discount).round(2) }

    it 'discount' do
      current_page.form.coupon.fill_in(with: coupon.code)
      current_page.form.apply.click
      expect(current_page.order_total.text).to eq(I18n.t(:price, money: order_item.book.price - discount))
    end
  end
end
