# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.where(status: orders_params[:filter])
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  private

  def orders_params
    params.permit(:filter)
  end
end
