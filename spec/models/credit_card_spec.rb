# frozen_string_literal: true

RSpec.describe CreditCard, type: :model do
  it { is_expected.to have_db_column(:order_id) }
  it { is_expected.to have_db_column(:number) }
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:validity) }
  it { is_expected.to have_db_column(:cvv) }
  it { is_expected.to have_db_index(:order_id) }
  it { is_expected.to belong_to(:order) }
end
