# frozen_string_literal: true

class Book
  class FilterSort
    SORT = {
      newest: ->(scope) { scope.order(created_at: :desc) },
      popular: lambda { |scope|
        scope.left_joins(:order_items).group(:id).order('COUNT(order_items.quantity) DESC NULLS LAST')
      },
      price_asc: ->(scope) { scope.order(price: :asc) },
      price_desc: ->(scope) { scope.order(price: :desc) },
      title_asc: ->(scope) { scope.order(title: :asc) },
      title_desc: ->(scope) { scope.order(title: :desc) }
    }.freeze

    def initialize(params:, scope: Book.all)
      @scope = scope
      @params = params
    end

    def call
      scope.yield_self { |scope| filter(scope) }.yield_self(&sort)
    end

    private

    attr_reader :scope

    def sort
      SORT.fetch(@params[:sort]&.to_sym, SORT[:title_asc])
    end

    def filter(relation)
      @params[:filter] ? relation.where(category_id: @params[:filter]) : relation
    end
  end
end
