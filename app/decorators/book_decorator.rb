# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  DESCRIPTION_LENGTH = 150

  delegate_all

  def all_authors
    authors.map { |author| "#{author.first_name} #{author.second_name}" }.join(', ')
  end

  def short_description
    description.truncate(DESCRIPTION_LENGTH, separator: ' ')
  end
end
