# frozen_string_literal: true

module Checkout
  class UpdateAddress
    attr_reader :form

    def initialize(order, params)
      @order = order
      @params = params
    end

    def call
      if @params[:use_billing]
        @params[:billing_address].except(:type).each do |key, _|
          @params[:shipping_address][key] = @params[:billing_address][key]
        end
      end

      @form = OrderForm.new(@order)
      return unless @form.validate(@params)

      @form.save
      @order.delivery_status!
    end

    def success?
      @form.errors.empty?
    end
  end
end
