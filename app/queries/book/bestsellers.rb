# frozen_string_literal: true

class Book
  class Bestsellers
    def self.call
      Book.left_joins(order_items: :order).where({ orders: { status: %i[complete in_delivery delivered] } })
          .group(:id).select('books.*, COUNT(order_items.id) as sold_count').order(sold_count: :desc)
          .uniq(&:category_id)
    end
  end
end
