# frozen_string_literal: true

RSpec.describe ReviewForm, type: :form do
  subject { described_class.new(Review.new) }

  describe 'when params is null' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:book_id) }
    it { is_expected.to validate_presence_of(:score) }
  end

  describe 'when params is valid' do
    let(:attributes) { attributes_for(:review) }

    it { is_expected.to allow_value(attributes[:title]).for(:title) }
    it { is_expected.to allow_value(attributes[:text]).for(:text) }
  end

  describe 'when params is invalid format' do
    let(:invalid_param) { ':' }

    it { is_expected.not_to allow_value(invalid_param).for(:title) }
    it { is_expected.not_to allow_value(invalid_param).for(:text) }
  end

  describe 'when params is too long' do
    let(:invalid_title) { Array.new(ReviewForm::LENGTH[:title] + 1) { rand(10) }.join }
    let(:invalid_text) { Array.new(ReviewForm::LENGTH[:text] + 1) { rand(10) }.join }

    it { is_expected.not_to allow_value(invalid_title).for(:title) }
    it { is_expected.not_to allow_value(invalid_text).for(:text) }
  end
end
