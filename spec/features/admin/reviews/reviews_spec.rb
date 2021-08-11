# frozen_string_literal: true

RSpec.describe 'Reviews', type: :feature, js: true do
  let(:current_page) { ReviewsPage.new }
  let!(:unprocessed_review) { create(:review, status: 0) }
  let!(:processed_review) { create(:review, status: rand(1..2)) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'unprocessed' do
    it 'displays attributes of unprocessed review' do
      %i[title status].each do |attribute|
        expect(current_page).to have_content unprocessed_review[attribute]
      end
    end

    it 'not display attributes of processed review' do
      %i[title status].each do |attribute|
        expect(current_page).not_to have_content processed_review[attribute]
      end
    end

    it 'redirect to view page' do
      current_page.view.click
      expect(current_page.current_url).to include("/admin/reviews/#{unprocessed_review.id}")
    end
  end

  describe 'processed' do
    before do
      current_page.processed.click
    end

    it 'displays attributes of processed review' do
      %i[title status].each do |attribute|
        expect(current_page).to have_content processed_review[attribute]
      end
    end

    it 'not display attributes of unprocessed review' do
      %i[title status].each do |attribute|
        expect(current_page).not_to have_content unprocessed_review[attribute]
      end
    end

    it 'redirect to view page' do
      current_page.view.click
      expect(current_page.current_url).to include("/admin/reviews/#{processed_review.id}")
    end
  end
end
