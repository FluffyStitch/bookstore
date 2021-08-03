# frozen_string_literal: true

class Book
  class FilterBooks
    SORT = {
      I18n.t('sort.newest') => { created_at: :desc },
      I18n.t('sort.popular') => { created_at: :asc },
      I18n.t('sort.price_asc') => { price: :asc },
      I18n.t('sort.price_desc') => { price: :desc }
    }.freeze

    def initialize(params)
      @sort = params[:sort] || I18n.t('sort.newest')
      @filter = params[:filter]
    end

    def call
      filter
      sort
      BookDecorator.decorate_collection(@books)
    end

    def filter
      @books = @filter ? Book.where(category_id: @filter) : Book.all
    end

    def sort
      @books = @books.order(SORT[@sort])
    end
  end
end
