# frozen_string_literal: true

class StaticPagesController < ApplicationController
  BOOKS_COUNT = 4

  def home
    @latest = BookDecorator.decorate_collection(Book.includes(:authors).last(BOOKS_COUNT))
    @bestsellers = BookDecorator.decorate_collection(Book::Bestsellers.call)
  end
end
