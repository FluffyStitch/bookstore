# frozen_string_literal: true

RSpec.describe Order, type: :model do
  it { is_expected.to have_db_column(:user_id) }
  it { is_expected.to have_db_column(:uniq_number) }
  it { is_expected.to have_db_column(:status) }
  it { is_expected.to have_db_index(:user_id) }
  it { is_expected.to have_db_index(:delivery_type_id) }
  it { is_expected.to belong_to(:user).optional(true) }
  it { is_expected.to have_one(:coupon).dependent(:destroy) }
  it { is_expected.to have_many(:order_items).dependent(:destroy) }
  it { is_expected.to have_many(:books).through(:order_items) }
  it { is_expected.to have_one(:billing_address).dependent(:destroy) }
  it { is_expected.to have_one(:shipping_address).dependent(:destroy) }
  it { is_expected.to belong_to(:delivery_type).optional(true) }
  it { is_expected.to have_one(:credit_card).dependent(:destroy) }
end
