# frozen_string_literal: true

RSpec.describe AuthorBook, type: :model do
  it { is_expected.to have_db_column(:author_id) }
  it { is_expected.to have_db_column(:book_id) }
  it { is_expected.to belong_to(:author) }
  it { is_expected.to belong_to(:book) }
  it { is_expected.to have_db_index(:author_id) }
  it { is_expected.to have_db_index(:book_id) }
end
