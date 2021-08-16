# frozen_string_literal: true

RSpec.describe Review, type: :model do
  it { is_expected.to have_db_column(:book_id) }
  it { is_expected.to have_db_column(:title) }
  it { is_expected.to have_db_column(:text) }
  it { is_expected.to have_db_column(:user_id) }
  it { is_expected.to have_db_column(:status) }
  it { is_expected.to have_db_column(:score) }
  it { is_expected.to have_db_column(:created_at) }
  it { is_expected.to belong_to(:book) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_db_index(:book_id) }
  it { is_expected.to have_db_index(:user_id) }
end
