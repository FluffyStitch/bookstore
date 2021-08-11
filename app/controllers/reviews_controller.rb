# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @review = ReviewForm.new(current_user.reviews.new)
    @book = Book.find(review_params[:book_id])
    return render :create unless @review.validate(review_params)

    @review.save
    redirect_to(book_path(@book), notice: I18n.t(:review_posted))
  end

  private

  def review_params
    params.require(:review).permit(:title, :text, :score, :book_id)
  end
end
