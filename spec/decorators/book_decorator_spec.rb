# frozen_string_literal: true

RSpec.describe BookDecorator do
  let(:book) { create(:book).decorate }
  let(:authors) { book.authors }

  it { expect(book).to be_decorated }

  describe '#all_authors' do
    let(:output) { authors.map { |author| "#{author.first_name} #{author.second_name}" }.join(', ') }

    it { expect(book.all_authors).to eq output }
  end

  describe '#short_description' do
    let(:output) { book.description.truncate(BookDecorator::DESCRIPTION_LENGTH, separator: ' ') }

    it { expect(book.short_description).to eq output }
  end
end
