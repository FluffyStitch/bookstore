# frozen_string_literal: true

class ReviewForm < Reform::Form
  include Reform::Form::ActiveRecord

  LENGTH = {
    title: 80,
    text: 500
  }.freeze

  REGEX = %r{[A-Za-z0-9!#$%&'*+-/=?^_`{|}~]}.freeze

  property :title
  property :text
  property :score
  property :book_id

  validates :title, presence: true, length: { maximum: LENGTH[:title] }, format: { with: REGEX }
  validates :text, presence: true, length: { maximum: LENGTH[:text] }, format: { with: REGEX }
  validates :book_id, presence: true
  validates :score, presence: true
end
