# frozen_string_literal: true

RSpec.describe 'ViewOrder', type: :feature, js: true do
  let(:current_page) { ViewOrderPage.new }
  let!(:admin_user) { create(:admin_user) }
  let!(:order) { create(:order, status: status) }
  let(:status) { rand(5) }

  before do
    sign_in admin_user
    current_page.load(id: order.id)
  end

  it { expect(current_page).to be_displayed }

  describe 'when order in delivery' do
    let(:status) { 4 }

    it 'in delivery' do
      current_page.in_delivery_button.click
      expect(current_page).to have_content I18n.t('status.in_delivery')
    end
  end

  describe 'when order delivered' do
    let(:status) { 5 }

    it 'delivered' do
      current_page.delivered_button.click
      expect(current_page).to have_content I18n.t('status.delivered')
    end
  end

  describe 'when order canceled' do
    it 'canceled' do
      current_page.canceled_button.click
      expect(current_page).to have_content I18n.t('status.canceled')
    end
  end
end
