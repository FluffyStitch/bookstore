# frozen_string_literal: true

class Book
  class FilterBooks
    SORT = {
      I18n.t('sort.newest') => { created_at: :desc },
      I18n.t('sort.popular') => { created_at: :asc },
      I18n.t('sort.price_asc') => { price: :asc },
      I18n.t('sort.price_desc') => { price: :desc },
      I18n.t('sort.title_asc') => { title: :asc },
      I18n.t('sort.title_desc') => { title: :desc }
    }.freeze

    def initialize(params)
      @sort = params[:sort] || I18n.t('sort.title_asc')
      @filter = params[:filter]
    end

    def call
      @books = (@filter ? Book.where(category_id: @filter) : Book.all).order(SORT[@sort])
    end
  end
end
