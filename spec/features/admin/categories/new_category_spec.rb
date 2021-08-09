# frozen_string_literal: true

RSpec.describe 'NewCategory', type: :feature, js: true do
  let(:current_page) { NewCategoryPage.new }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'create category' do
    let(:attributes) { attributes_for(:category) }

    before do
      current_page.form.name.fill_in(with: attributes[:name])
      current_page.form.create.click
    end

    it 'success' do
      attributes.each { |attribute| expect(current_page).to have_content attribute.last }
    end
  end

  it 'redirect to categories' do
    current_page.cancel.click
    expect(current_page.current_url).to end_with(CategoriesPage.url)
  end
end
