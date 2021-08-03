# frozen_string_literal: true

RSpec.describe BookDecorator do
  let(:book) { create(:book).decorate }
  let(:authors) { book.authors }

  it { expect(book).to be_decorated }

  describe '#all_authors' do
    let(:output) { authors.map { |author| "#{author.first_name} #{author.second_name}" }.join(', ') }

    it 'output full names' do
      expect(book.all_authors).to eq output
    end
  end
end
