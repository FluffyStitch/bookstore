# frozen_string_literal: true

RSpec.describe OrderItem, type: :model do
  it { is_expected.to have_db_column(:order_id) }
  it { is_expected.to have_db_column(:book_id) }
  it { is_expected.to have_db_column(:quantity) }
  it { is_expected.to have_db_index(:order_id) }
  it { is_expected.to have_db_index(:book_id) }
  it { is_expected.to belong_to(:order) }
  it { is_expected.to belong_to(:book) }
end
