# frozen_string_literal: true

RSpec.describe 'Orders', type: :feature, js: true do
  let(:current_page) { OrdersPage.new }
  let!(:order) { create(:order) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  it 'displays attributes of order' do
    %i[uniq_number status].each do |attribute|
      expect(current_page).to have_content order[attribute]
    end
  end
end
