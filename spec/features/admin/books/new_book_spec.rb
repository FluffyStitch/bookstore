# frozen_string_literal: true

RSpec.describe 'NewBook', type: :feature, js: true do
  let(:current_page) { NewBookPage.new }
  let!(:category) { create(:category) }
  let!(:author) { create(:author) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'create book' do
    let(:attributes) { attributes_for(:book, :with_images, category: category, authors: author) }
    let(:image) { Dir[Rails.root.join('spec/fixtures/images/*')].sample }

    before do
      current_page.form.category.select(attributes[:category].name)
      current_page.form.title.fill_in(with: attributes[:title])
      current_page.form.price.fill_in(with: attributes[:price])
      current_page.form.quantity.fill_in(with: attributes[:quantity])
      current_page.form.description.fill_in(with: attributes[:description])
      current_page.form.year_of_publication.fill_in(with: attributes[:year_of_publication])
      current_page.form.height.fill_in(with: attributes[:height])
      current_page.form.width.fill_in(with: attributes[:width])
      current_page.form.depth.fill_in(with: attributes[:depth])
      current_page.form.materials.fill_in(with: attributes[:materials])
      current_page.form.authors.check
      current_page.form.main_image.attach_file attributes[:main_image].path
      current_page.form.add_new_image.click
      current_page.form.image.attach_file image
      current_page.form.create.click
    end

    it 'success' do
      attributes.keys.excluding(:category, :description, :quantity, :authors, :main_image).each do |attribute|
        expect(current_page).to have_content attributes[attribute]
      end
    end
  end

  it 'redirect to authors' do
    current_page.cancel.click
    expect(current_page.current_url).to end_with(BooksPage.url)
  end
end
