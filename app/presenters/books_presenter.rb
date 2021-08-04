# frozen_string_literal: true

class BooksPresenter < ApplicationPresenter
  CHOSEN_CATEGORY = 'chosen-category'

  attr_reader :books

  def initialize(books, params)
    super()
    @books = books
    @params = params
  end

  def clearfix(index)
    return if index.odd?

    classes = ['clearfix']
    classes << 'visible-xs' unless (index % 4).zero?
    tag.div class: classes
  end

  def current_sort
    @params[:sort]&.to_sym || :title_asc
  end

  def current_filter
    @params[:filter]
  end

  def sort_keys
    Book::FilterBooks::SORT
  end

  def choosen_category_class(category)
    CHOSEN_CATEGORY if category.id.to_s == current_filter
  end

  def default_choosen_category_class
    CHOSEN_CATEGORY if current_filter.nil?
  end

  def books_count(**options)
    Book.where(options).count
  end

  def current_sort_name
    I18n.t("sort.#{current_sort}")
  end

  def current_category_name
    current_filter ? Category.find_by(id: current_filter)&.name : I18n.t(:all)
  end
end
