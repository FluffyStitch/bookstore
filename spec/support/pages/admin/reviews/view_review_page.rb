# frozen_string_literal: true

class ViewReviewPage < SitePrism::Page
  set_url '/admin/reviews/{id}'

  element :approved, '#approved'
  element :rejected, '#rejected'
end
