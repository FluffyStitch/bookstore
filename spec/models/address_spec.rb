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
  it { is_expected.to have_db_column(:addressable_type) }
  it { is_expected.to have_db_column(:addressable_id) }
  it { is_expected.to belong_to(:addressable) }
  it { is_expected.to have_db_index(%i[addressable_type addressable_id]) }
end
