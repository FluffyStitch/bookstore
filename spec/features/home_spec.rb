# frozen_string_literal: true

RSpec.describe 'Home > Home', type: :feature, js: true do
  let(:current_page) { Home.new }

  it do
    current_page.load
    expect(current_page).to be_displayed
  end
end
