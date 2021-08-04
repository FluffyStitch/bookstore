# frozen_string_literal: true

RSpec.describe Category, type: :model do
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_many(:books).dependent(:destroy) }
end
