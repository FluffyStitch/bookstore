# frozen_string_literal: true

RSpec.describe Author, type: :model do
  it { is_expected.to have_db_column(:first_name) }
  it { is_expected.to have_db_column(:second_name) }
  it { is_expected.to have_many(:author_books).dependent(:destroy) }
  it { is_expected.to have_many(:books).through(:author_books) }
end
