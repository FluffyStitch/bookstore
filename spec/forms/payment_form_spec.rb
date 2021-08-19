# frozen_string_literal: true

RSpec.describe PaymentForm, type: :form do
  subject { described_class.new(CreditCard.new) }

  describe 'when params is null' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:validity) }
    it { is_expected.to validate_presence_of(:cvv) }
  end

  describe 'when params is valid' do
    let(:attributes) { attributes_for(:credit_card) }

    it { is_expected.to allow_value(attributes[:number]).for(:number) }
    it { is_expected.to allow_value(attributes[:name]).for(:name) }
    it { is_expected.to allow_value(attributes[:validity]).for(:validity) }
    it { is_expected.to allow_value(attributes[:cvv]).for(:cvv) }
  end

  describe 'when params is invalid format' do
    let(:invalid_param) { rand }

    it { is_expected.not_to allow_value(invalid_param).for(:number) }
    it { is_expected.not_to allow_value(invalid_param).for(:name) }
    it { is_expected.not_to allow_value(invalid_param).for(:validity) }
    it { is_expected.not_to allow_value(invalid_param).for(:cvv) }
  end
end
