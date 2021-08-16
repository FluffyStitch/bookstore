# frozen_string_literal: true

ActiveAdmin.register Order do
  actions :index, :show

  scope :in_progress, default: true do |scope|
    scope.where(status: %i[in_progress in_queue in_delivery])
  end
  scope :delivered
  scope :canceled

  index do
    selectable_column
    column :id
    column :created_at
    column :status
    actions
  end

  member_action :delivered, method: :put do
    resource.delivered!
    redirect_to admin_orders_path, notice: I18n.t(:delivered)
  end

  member_action :canceled, method: :put do
    resource.canceled!
    redirect_to admin_orders_path, notice: I18n.t(:canceled)
  end

  action_item :delivered, only: :show, if: proc { order.in_delivery? } do
    link_to I18n.t(:delivered), delivered_admin_order_path(order), method: :put, id: :delivered
  end

  action_item :canceled, only: :show, if: proc { !order.canceled? } do
    link_to I18n.t(:canceled), canceled_admin_order_path(order), method: :put, id: :canceled
  end
end
