# frozen_string_literal: true

class BookImage < ApplicationRecord
  belongs_to :book
  belongs_to :image
end
