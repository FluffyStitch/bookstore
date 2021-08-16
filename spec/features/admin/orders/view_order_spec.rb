# frozen_string_literal: true

RSpec.describe 'ViewOrder', type: :feature, js: true do
  let(:current_page) { ViewOrderPage.new }
  let!(:order) { create(:order, status: 2) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load(id: order.id)
  end

  it { expect(current_page).to be_displayed }

  it 'delivered' do
    current_page.delivered.click
    expect(current_page).to have_content I18n.t(:delivered)
  end

  it 'canceled' do
    current_page.canceled.click
    expect(current_page).to have_content I18n.t(:canceled)
  end
end
