# frozen_string_literal: true

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:email) }
  it { is_expected.to have_db_column(:encrypted_password) }
  it { is_expected.to have_db_column(:provider) }
  it { is_expected.to have_db_column(:uid) }
  it { is_expected.to have_db_column(:reset_password_token) }
  it { is_expected.to have_db_column(:reset_password_sent_at) }
  it { is_expected.to have_db_column(:remember_created_at) }
  it { is_expected.to have_db_column(:confirmation_token) }
  it { is_expected.to have_db_column(:confirmed_at) }
  it { is_expected.to have_db_column(:confirmation_sent_at) }
  it { is_expected.to have_db_index(:confirmation_token) }
  it { is_expected.to have_db_index(:email) }
  it { is_expected.to have_db_index(:reset_password_token) }
  it { is_expected.to validate_presence_of(:email) }

  describe 'when params is valid' do
    let(:email) { FFaker::Internet.email }
    let(:password) { FFaker::Internet.password }

    it { is_expected.to allow_value(email).for(:email) }
    it { is_expected.to allow_value(password).for(:password) }
  end

  describe 'when params is invalid' do
    let(:email) { FFaker::AnimalUS.common_name }
    let(:password) { FFaker::AnimalUS.common_name }

    it { is_expected.not_to allow_value(email).for(:email) }
    it { is_expected.not_to allow_value(password).for(:password) }
  end
end
