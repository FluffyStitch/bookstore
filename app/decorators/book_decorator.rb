# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all

  def all_authors
    authors.map { |author| "#{author.first_name} #{author.second_name}" }.join(', ')
  end
end
