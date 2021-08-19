# frozen_string_literal: true

RSpec.describe DeliveryType, type: :model do
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:min_days) }
  it { is_expected.to have_db_column(:max_days) }
  it { is_expected.to have_db_column(:price) }
end
