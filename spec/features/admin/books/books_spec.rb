# frozen_string_literal: true

RSpec.describe 'Books', type: :feature, js: true do
  let(:current_page) { BooksPage.new }
  let!(:book) { create(:book) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  it 'displays all attributes' do
    %i[category title price].each do |attribute|
      expect(current_page).to have_content book[attribute]
    end
  end

  it 'redirect to create page' do
    current_page.create.click
    expect(current_page.current_url).to end_with(NewBookPage.url)
  end

  it 'redirect to edit page' do
    current_page.edit.click
    expect(current_page.current_url).to end_with('/edit')
  end

  it 'redirect to book page' do
    current_page.view.click
    expect(current_page.current_url).to end_with("/admin/books/#{book.id}")
  end
end
