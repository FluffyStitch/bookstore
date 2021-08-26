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
end
