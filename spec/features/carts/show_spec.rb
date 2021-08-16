# frozen_string_literal: true

RSpec.describe 'Cart > Show', type: :feature, js: true do
  let(:current_page) { CartPage.new }
  let(:cart) { user.create_current_order }
  let!(:order_item) { cart.order_items.create(params) }
  let(:user) { create(:user) }
  let(:params) { attributes_for(:order_item, quantity: 1) }

  def wait_for_ajax
    Timeout.timeout(20) do
      loop do
        active = page.evaluate_script('$.active')
        break if active == 0
      end
    end
  end

  before do
    sign_in user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'when change count' do
    it 'plus' do
      current_page.order_items.first.plus.click
      expect(current_page.order_total).to have_text(I18n.t(:price, money: order_item.book.price * 2))
    end

    context 'when minus' do
      let(:params) { attributes_for(:order_item, quantity: 2) }

      it 'minus' do
        current_page.order_items.first.minus.click
        expect(current_page.order_total).to have_text(I18n.t(:price, money: order_item.book.price))
      end
    end

    it 'does not minus' do
      current_page.order_items.first.minus.click
      expect(current_page.order_total).to have_text(I18n.t(:price, money: order_item.book.price))
    end
  end

  describe 'when delete order item' do
    it 'delete' do
      current_page.order_items.first.delete.click
      expect(current_page).to have_no_order_items
    end
  end

  describe 'when add coupon' do
    let(:coupon) { create(:coupon) }
    let(:discount) { (order_item.book.price * coupon.discount).round(2) }

    it 'discount' do
      current_page.form.coupon.fill_in(with: coupon.code)
      current_page.form.apply.click
      expect(current_page.order_total).to have_text(I18n.t(:price, money: order_item.book.price - discount))
    end
  end
end
