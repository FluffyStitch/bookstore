# frozen_string_literal: true

RSpec.describe 'EditAuthor', type: :feature, js: true do
  let(:current_page) { EditAuthorPage.new }
  let!(:author) { create(:author) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load(id: author.id)
  end

  it { expect(current_page).to be_displayed }

  describe 'edit author' do
    let(:attributes) { attributes_for(:author) }

    before do
      current_page.form.first_name.fill_in(with: attributes[:first_name])
      current_page.form.second_name.fill_in(with: attributes[:second_name])
      current_page.form.description.fill_in(with: attributes[:description])
      current_page.form.edit.click
    end

    it 'success' do
      attributes.each { |attribute| expect(current_page).to have_content attribute.last }
    end
  end

  it 'redirect to authors' do
    current_page.cancel.click
    expect(current_page.current_url).to end_with(AuthorsPage.url)
  end
end
