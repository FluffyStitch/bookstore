# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  include ImageUploader::Attachment(:main_image)
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :newest, -> { order(created_at: :desc) }
  scope :popular, -> { left_joins(:order_items).group(:id).order('COUNT(order_items.quantity) DESC') }
  scope :price_asc, -> { order(price: :asc) }
  scope :price_desc, -> { order(price: :desc) }
  scope :title_asc, -> { order(title: :asc) }
  scope :title_desc, -> { order(title: :desc) }
end
