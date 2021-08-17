# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :book

  include ImageUploader::Attachment(:image)
end
