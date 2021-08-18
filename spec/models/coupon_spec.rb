# frozen_string_literal: true

RSpec.describe Coupon, type: :model do
  it { is_expected.to have_db_column(:order_id) }
  it { is_expected.to have_db_column(:discount) }
  it { is_expected.to have_db_column(:code) }
  it { is_expected.to have_db_column(:active) }
  it { is_expected.to have_db_index(:order_id) }
  it { is_expected.to belong_to(:order).optional(true) }
end
