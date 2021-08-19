# frozen_string_literal: true

module Checkout
  class Payment
    attr_reader :form

    def initialize(order, params)
      @order = order
      @params = params
    end

    def call
      @form = PaymentForm.new(@order.create_credit_card)
      return unless @form.validate(@params[:credit_card])

      @form.save
      @order.confirm_status!
    end

    def success?
      @form.errors.empty?
    end
  end
end
