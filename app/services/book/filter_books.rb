# frozen_string_literal: true

class Book
  class FilterBooks
    SORT = {
      newest: { created_at: :desc },
      popular: { created_at: :asc },
      price_asc: { price: :asc },
      price_desc: { price: :desc },
      title_asc: { title: :asc },
      title_desc: { title: :desc }
    }.freeze

    def initialize(params)
      @params = params
    end

    def call
      (@params[:filter] ? Book.where(category_id: @params[:filter]) : Book.all).order(sort_param)
    end

    private

    def sort_param
      SORT[@params[:sort]&.to_sym] || SORT[:newest]
    end
  end
end
