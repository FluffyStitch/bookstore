# frozen_string_literal: true

RSpec.describe Image, type: :model do
  it { is_expected.to have_db_column(:image_data) }
  it { is_expected.to belong_to(:book) }
  it { is_expected.to have_db_index(:book_id) }
end
