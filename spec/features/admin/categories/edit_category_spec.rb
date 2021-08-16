# frozen_string_literal: true

RSpec.describe 'EditCategory', type: :feature, js: true do
  let(:current_page) { EditCategoryPage.new }
  let!(:category) { create(:category) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load(id: category.id)
  end

  it { expect(current_page).to be_displayed }

  describe 'edit category' do
    let(:attributes) { attributes_for(:category) }

    before do
      current_page.form.name.fill_in(with: attributes[:name])
      current_page.form.edit.click
    end

    it 'success' do
      attributes.each { |attribute| expect(current_page).to have_content attribute.last }
    end
  end

  it 'redirect to authors' do
    current_page.cancel.click
    expect(current_page.current_url).to end_with(CategoriesPage.url)
  end
end
