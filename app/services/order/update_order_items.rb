# frozen_string_literal: true

class Order
  class UpdateOrderItems
    attr_reader :message

    def initialize(cart:, params:)
      @cart = cart
      @params = params
    end

    def call
      order_item = @cart.order_items.find_by(book_id: @params[:book_id])
      return change_quantity(order_item) unless order_item.nil?

      @cart.order_items.create(@params)
    end

    private

    def change_quantity(order_item)
      new_quantity = order_item.quantity + @params[:quantity].to_i
      order_item.update(quantity: new_quantity) if new_quantity.positive?
      order_item
    end
  end
end
