# frozen_string_literal: true

RSpec.describe 'Orders', type: :feature, js: true do
  let(:current_page) { OrdersPage.new }
  let!(:in_progress) { create(:order, status: rand(5)) }
  let!(:delivered) { create(:order, status: 6) }
  let!(:canceled) { create(:order, status: 7) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'in_progress' do
    it 'displays attributes of in_progress order' do
      %i[uniq_number status].each do |attribute|
        expect(current_page).to have_content in_progress[attribute]
      end
    end

    it 'not display attributes of delivered order' do
      %i[uniq_number status].each do |attribute|
        expect(current_page).not_to have_content delivered[attribute]
      end
    end

    it 'not display attributes of canceled order' do
      %i[uniq_number status].each do |attribute|
        expect(current_page).not_to have_content canceled[attribute]
      end
    end

    it 'redirect to view page' do
      current_page.view.click
      expect(current_page.current_url).to include("/admin/orders/#{in_progress.id}")
    end
  end

  describe 'delivered' do
    before do
      current_page.delivered.click
    end

    it 'displays attributes of delivered order' do
      %i[uniq_number status].each do |attribute|
        expect(current_page).to have_content delivered[attribute]
      end
    end

    it 'not display attributes of in_progress order' do
      %i[uniq_number status].each do |attribute|
        expect(current_page).not_to have_content in_progress[attribute]
      end
    end

    it 'not display attributes of canceled order' do
      %i[uniq_number status].each do |attribute|
        expect(current_page).not_to have_content canceled[attribute]
      end
    end

    it 'redirect to view page' do
      current_page.view.click
      expect(current_page.current_url).to include("/admin/orders/#{delivered.id}")
    end
  end

  describe 'canceled' do
    before do
      current_page.canceled.click
    end

    it 'displays attributes of canceled order' do
      %i[uniq_number status].each do |attribute|
        expect(current_page).to have_content canceled[attribute]
      end
    end

    it 'not display attributes of in_progress order' do
      %i[uniq_number status].each do |attribute|
        expect(current_page).not_to have_content in_progress[attribute]
      end
    end

    it 'not display attributes of delivered order' do
      %i[uniq_number status].each do |attribute|
        expect(current_page).not_to have_content delivered[attribute]
      end
    end

    it 'redirect to view page' do
      current_page.view.click
      expect(current_page.current_url).to include("/admin/orders/#{canceled.id}")
    end
  end
end

# RSpec.describe 'Orders', type: :feature, js: true do
#   let(:current_page) { OrdersPage.new }
#   let!(:order) { create(:order) }
#   let!(:admin_user) { create(:admin_user) }

#   before do
#     sign_in admin_user
#     current_page.load
#   end

#   it { expect(current_page).to be_displayed }

#   it 'displays attributes of order' do
#     %i[uniq_number status].each do |attribute|
#       expect(current_page).to have_content order[attribute]
#     end
#   end
# end
