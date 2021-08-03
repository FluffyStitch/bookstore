# frozen_string_literal: true

class BooksPresenter < ApplicationPresenter
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
    @params[:sort] || I18n.t('sort.newest')
  end

  def current_filter
    @params[:filter]
  end

  def categories
    Category.all
  end

  def sort_keys
    Book::FilterBooks::SORT
  end
end
