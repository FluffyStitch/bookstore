# frozen_string_literal: true

module Checkout
  class Delivery
    attr_reader :form

    def initialize(order, params)
      @order = order
      @params = params
    end

    def call
      @form = DeliveryForm.new(@order)
      return unless @form.validate(@params)

      @form.save
      @order.payment_status!
    end

    def success?
      @form.errors.empty?
    end
  end
end
