# frozen_string_literal: true

class ReviewsPage < SitePrism::Page
  set_url '/admin/reviews'

  element :unprocessed, '.unprocessed'
  element :processed, '.processed'

  element :view, '.view_link'
end
