# frozen_string_literal: true

class BooksController < ApplicationController
  include Pagy::Backend

  decorates_assigned :book

  def index
    @pagy, books = pagy_countless(Book::FilterBooks.new(params).call, link_extra: 'data-remote="true"')
    @presenter = BooksPresenter.new(books, params)
  end

  def show
    @book = Book.find_by(id: params[:id]).decorate
  end
end
