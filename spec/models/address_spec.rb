# frozen_string_literal: true

RSpec.describe Address, type: :model do
  it { is_expected.to have_db_column(:first_name) }
  it { is_expected.to have_db_column(:last_name) }
  it { is_expected.to have_db_column(:address) }
  it { is_expected.to have_db_column(:city) }
  it { is_expected.to have_db_column(:zip) }
  it { is_expected.to have_db_column(:country) }
  it { is_expected.to have_db_column(:phone) }
  it { is_expected.to have_db_column(:type) }
  it { is_expected.to have_db_column(:user_id) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_db_index(:user_id) }
end
