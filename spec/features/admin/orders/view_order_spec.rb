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

  it 'displays attributes of order' do
    %i[uniq_number books coupon status].each do |attribute|
      expect(current_page).to have_content order[attribute]
    end
  end
end
