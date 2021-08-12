# frozen_string_literal: true

class Image < ApplicationRecord
  has_many :book_images, dependent: :destroy
  has_many :books, through: :book_images

  include ImageUploader::Attachment(:image)
end
