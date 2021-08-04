# frozen_string_literal: true

RSpec.describe Book, type: :model do
  it { is_expected.to have_db_column(:title) }
  it { is_expected.to have_db_column(:price) }
  it { is_expected.to have_db_column(:quantity) }
  it { is_expected.to have_db_column(:description) }
  it { is_expected.to have_db_column(:year_of_publication) }
  it { is_expected.to have_db_column(:height) }
  it { is_expected.to have_db_column(:width) }
  it { is_expected.to have_db_column(:depth) }
  it { is_expected.to have_db_column(:materials) }
  it { is_expected.to belong_to(:category) }
  it { is_expected.to have_db_index(:category_id) }
  it { is_expected.to have_many(:author_books).dependent(:destroy) }
  it { is_expected.to have_many(:authors).through(:author_books) }
end
