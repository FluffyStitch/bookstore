# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  helper_method :categories

  private

  def categories
    Category.all
  end
end
