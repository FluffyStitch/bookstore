# frozen_string_literal: true

class BooksController < ApplicationController
  include Pagy::Backend

  SORT = {
    I18n.t('sort.newest') => { created_at: :desc },
    I18n.t('sort.popular') => { created_at: :asc },
    I18n.t('sort.price_asc') => { price: :asc },
    I18n.t('sort.price_desc') => { price: :desc }
  }.freeze

  def index
    @sort = params[:sort] || I18n.t('sort.newest')
    @filter = params[:filter]
    books = @filter ? Book.where(category_id: @filter) : Book.all
    @pagy, @books = pagy(books.order(SORT[@sort]))
  end

  def show
    @book = Book.find_by(id: params[:id])
  end
end
