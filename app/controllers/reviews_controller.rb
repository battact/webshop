class ReviewsController < InheritedResources::Base

  def create
  	@review = Review.new(review_params)
  	respond_to do |format|
    if @review.save
      format.html { redirect_to @review, notice: 'User was successfully created.' }
      format.js   {}
      format.json { render json: @review, status: :created, location: @review }
    else
      format.html { render action: "new" }
      format.json { render json: @review.errors, status: :unprocessable_entity }
    end
  end
  end

  private

    def review_params
      params.require(:review).permit(:description, :user_id, :product_id)
    end
end

