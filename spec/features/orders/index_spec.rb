# frozen_string_literal: true

RSpec.describe 'Orders > Index', type: :feature, js: true do
  let(:current_page) { MyOrders.new }
  let!(:order) { create(:order, status: status) }

  before { current_page.load(query: { filter: filter }) }

  describe 'when complete orders' do
    let(:filter) { :complete }
    let(:status) { 4 }

    it { expect(current_page.orders.first).to have_content order.uniq_number }
  end

  describe 'when in_delivery orders' do
    let(:filter) { :in_delivery }
    let(:status) { 5 }

    it { expect(current_page.orders.first).to have_content order.uniq_number }
  end

  describe 'when delivered orders' do
    let(:filter) { :delivered }
    let(:status) { 6 }

    it { expect(current_page.orders.first).to have_content order.uniq_number }
  end

  describe 'when canceled orders' do
    let(:filter) { :canceled }
    let(:status) { 7 }

    it { expect(current_page.orders.first).to have_content order.uniq_number }
  end
end
