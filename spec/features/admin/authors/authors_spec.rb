# frozen_string_literal: true

RSpec.describe 'Authors', type: :feature, js: true do
  let(:current_page) { AuthorsPage.new }
  let!(:author) { create(:author) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  it 'displays all attributes' do
    author.attributes.keys.excluding('id', 'created_at', 'updated_at').each do |attribute|
      expect(current_page).to have_content author[attribute]
    end
  end

  it 'redirect to create page' do
    current_page.create.click
    expect(current_page.current_url).to end_with(NewAuthorPage.url)
  end

  it 'redirect to edit page' do
    current_page.edit.click
    expect(current_page.current_url).to end_with('/edit')
  end
end
