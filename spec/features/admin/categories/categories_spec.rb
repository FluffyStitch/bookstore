# frozen_string_literal: true

RSpec.describe 'Categories', type: :feature, js: true do
  let(:current_page) { CategoriesPage.new }
  let!(:category) { create(:category) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  it 'displays all attributes' do
    category.attributes.keys.excluding('id', 'created_at', 'updated_at').each do |attribute|
      expect(current_page).to have_content category[attribute]
    end
  end

  it 'redirect to create page' do
    current_page.create.click
    expect(current_page.current_url).to end_with(NewCategoryPage.url)
  end

  it 'redirect to edit page' do
    current_page.edit.click
    expect(current_page.current_url).to end_with('/edit')
  end
end
