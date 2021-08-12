# frozen_string_literal: true

ActiveAdmin.register Review do
  actions :index, :show

  includes :book, :user

  scope :unprocessed, default: true
  scope :processed, &:not_unprocessed

  index do
    selectable_column
    column :book
    column :title
    column :created_at
    column :user
    column :status
    actions
  end

  member_action :approved, method: :put do
    resource.approved!
    redirect_to admin_reviews_path, notice: "#{I18n.t(:approved)}!"
  end

  member_action :rejected, method: :put do
    resource.rejected!
    redirect_to admin_reviews_path, notice: "#{I18n.t(:rejected)}!"
  end

  action_item :approved, only: :show do
    link_to I18n.t(:approved), approved_admin_review_path(review), method: :put, id: :approved
  end

  action_item :rejected, only: :show do
    link_to I18n.t(:rejected), rejected_admin_review_path(review), method: :put, id: :rejected
  end
end
