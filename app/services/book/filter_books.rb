# frozen_string_literal: true

class Book
  class FilterBooks
    SORT = %i[newest popular price_asc price_desc title_asc title_desc].freeze

    def initialize(params)
      @params = params
    end

    def call
      (@params[:filter] ? Book.where(category_id: @params[:filter]) : Book.all).public_send(sort_param)
    end

    private

    def sort_param
      SORT.include?(@params[:sort]&.to_sym) ? @params[:sort] : :title_asc
    end
  end
end
