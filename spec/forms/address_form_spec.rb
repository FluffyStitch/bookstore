# frozen_string_literal: true

RSpec.describe AddressForm, type: :form do
  subject { described_class.new(BillingAddress.new) }

  describe 'when params is null' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:type) }
  end

  describe 'when params is valid' do
    let(:attributes) { attributes_for(:billing_address) }

    it { is_expected.to allow_value(attributes[:first_name]).for(:first_name) }
    it { is_expected.to allow_value(attributes[:last_name]).for(:last_name) }
    it { is_expected.to allow_value(attributes[:address]).for(:address) }
    it { is_expected.to allow_value(attributes[:city]).for(:city) }
    it { is_expected.to allow_value(attributes[:zip]).for(:zip) }
    it { is_expected.to allow_value(attributes[:type]).for(:type) }
  end

  describe 'when params is invalid format' do
    let(:invalid_param) { rand }

    it { is_expected.not_to allow_value(invalid_param).for(:first_name) }
    it { is_expected.not_to allow_value(invalid_param).for(:last_name) }
    it { is_expected.not_to allow_value(invalid_param).for(:address) }
    it { is_expected.not_to allow_value(invalid_param).for(:city) }
    it { is_expected.not_to allow_value(invalid_param).for(:zip) }
    it { is_expected.not_to allow_value(invalid_param).for(:country) }
    it { is_expected.not_to allow_value(invalid_param).for(:phone) }
    it { is_expected.not_to allow_value(invalid_param).for(:type) }
  end

  describe 'when params is too long' do
    let(:invalid_param) { Array.new(AddressForm::LENGTH[:first_name] + 1) { rand(10) }.join }

    it { is_expected.not_to allow_value(invalid_param).for(:first_name) }
    it { is_expected.not_to allow_value(invalid_param).for(:last_name) }
    it { is_expected.not_to allow_value(invalid_param).for(:address) }
    it { is_expected.not_to allow_value(invalid_param).for(:city) }
    it { is_expected.not_to allow_value(invalid_param).for(:zip) }
    it { is_expected.not_to allow_value(invalid_param).for(:country) }
    it { is_expected.not_to allow_value(invalid_param).for(:phone) }
  end
end
