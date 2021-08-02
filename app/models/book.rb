# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  def all_authors
    authors.map { |author| author.first_name << ' ' << author.second_name }.join(', ')
  end
end
