# frozen_string_literal: true

class Book
  class Bestsellers
    def self.call
      Book.popular.left_joins(:orders).where({ orders: { status: %i[complete in_delivery delivered] } })
    end
  end
end
