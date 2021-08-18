# frozen_string_literal: true

ActiveAdmin.register Order do
  actions :index, :show

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
end
