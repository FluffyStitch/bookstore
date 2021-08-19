# frozen_string_literal: true

RSpec.describe UpdateAddress do
  subject(:address) { described_class.new(order, order_params).call }

  before { address }

  let(:order) { create(:order, status: 0) }

  describe 'when both addresses are valid' do
    let(:order_params) { { billing_address: billing, shipping_address: shipping } }
    let(:country) { ISO3166::Country.find_country_by_name(FFaker::Address.country).alpha2 }
    let(:phone) { "+#{ISO3166::Country.find_country_by_alpha2(country).country_code}#{Array.new(9) { rand(9) }.join}" }
    let(:billing) { attributes_for(:billing_address, country: country, phone: phone) }
    let(:shipping) { attributes_for(:shipping_address, country: country, phone: phone) }

    it { expect(address).to be true }

    it { expect(order.billing_address).not_to be nil }

    it { expect(order.shipping_address).not_to be nil }
  end

  describe 'when use valid billing address' do
    let(:order_params) { { billing_address: billing, shipping_address: {}, use_billing: '1' } }
    let(:country_name) { FFaker::Address.country }
    let(:country) { ISO3166::Country.find_country_by_name(country_name).alpha2 }
    let(:phone) { "+#{ISO3166::Country.find_country_by_alpha2(country).country_code}#{Array.new(9) { rand(9) }.join}" }
    let(:billing) { attributes_for(:billing_address, country: country, phone: phone) }

    it { expect(address).to be true }

    it { expect(order.billing_address).not_to be nil }

    it { expect(order.shipping_address).not_to be nil }
  end
end
