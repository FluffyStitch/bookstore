# frozen_string_literal: true

RSpec.describe 'Home > Home', type: :feature, js: true do
  let(:current_page) { Home.new }

  before do
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  it 'redirect to catalog' do
    current_page.start.click
    expect(current_page.current_url).to end_with('/books')
  end
end
