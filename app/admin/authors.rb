# frozen_string_literal: true

ActiveAdmin.register Author do
  permit_params :first_name, :second_name, :description

  index do
    selectable_column
    column :first_name
    column :second_name
    column :description
    actions
  end
end
