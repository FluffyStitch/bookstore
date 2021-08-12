# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :reviews, dependent: :destroy
  has_many :book_images, dependent: :destroy
  has_many :images, through: :book_images

  include ImageUploader::Attachment(:main_image)
  accepts_nested_attributes_for :images, allow_destroy: true
end
