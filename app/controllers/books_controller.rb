# frozen_string_literal: true

class BooksController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, books = pagy_countless(prepared_books, link_extra: 'data-remote="true"')
    @presenter = BooksPresenter.new(books, params)
  end

  def show
    @book = Book.find_by(id: params[:id])&.decorate
    redirect_to root_path, alert: I18n.t(:book_not_found) unless @book
  end

  private

  def prepared_books
    Book::FilterSort.new(params: permitted_params).call.includes(:authors).decorate
  end

  def permitted_params
    params.permit(:filter, :sort)
  end
end
