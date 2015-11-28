class ReviewsController < InheritedResources::Base

  private

    def review_params
      params.require(:review).permit(:title, :description, :user_id)
    end
end

