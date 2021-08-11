# frozen_string_literal: true

RSpec.describe 'ViewReview', type: :feature, js: true do
  let(:current_page) { ViewReviewPage.new }
  let!(:review) { create(:review, status: 0) }
  let!(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
    current_page.load(id: review.id)
  end

  it { expect(current_page).to be_displayed }

  it 'approved' do
    current_page.approved.click
    expect(current_page).to have_content I18n.t(:approved)
  end

  it 'rejected' do
    current_page.rejected.click
    expect(current_page).to have_content I18n.t(:rejected)
  end
end
