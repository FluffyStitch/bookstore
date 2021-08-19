# frozen_string_literal: true

ActiveAdmin.register Order do
  actions :index, :show

  scope :in_progress, default: true do |scope|
    scope.where(status: %i[address delivery payment confirm complete in_delivery])
  end
  scope :delivered
  scope :canceled

  index do
    selectable_column
    column :uniq_number
    column :created_at
    column :status
    actions
  end

  show do
    attributes_table do
      row :uniq_number
      row :created_at
      row :books
      row :coupon
      row :status
    end
  end

  member_action :in_delivery, method: :put do
    resource.in_delivery_status!
    redirect_to admin_orders_path, notice: "#{I18n.t('status.in_delivery')}!"
  end

  member_action :delivered, method: :put do
    resource.delivered_status!
    redirect_to admin_orders_path, notice: "#{I18n.t('status.delivered')}!"
  end

  member_action :canceled, method: :put do
    resource.canceled_status!
    redirect_to admin_orders_path, notice: "#{I18n.t('status.canceled')}!"
  end

  action_item :in_delivery, only: :show, if: proc { resource.complete? } do
    link_to I18n.t('status.in_delivery'), in_delivery_admin_order_path(order), method: :put, id: :in_delivery
  end

  action_item :delivered, only: :show, if: proc { resource.in_delivery? } do
    link_to I18n.t('status.delivered'), delivered_admin_order_path(order), method: :put, id: :delivered
  end

  action_item :canceled, only: :show, if: proc { !resource.canceled? } do
    link_to I18n.t('status.canceled'), canceled_admin_order_path(order), method: :put, id: :canceled
  end
end
