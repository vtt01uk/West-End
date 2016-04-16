class ReviewsController < ApplicationController
  before_action :find_play
  before_action :find_review, only: [:edit, :update]

  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.play_id = @play.id
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to play_path(@play)
    else
      render 'new'
    end
  end
  
  def edit

  end
  
  def update

    if @review.update(review_params)
      flash[:notice] = "Review has been updated"
      redirect_to play_path(@play)
    else
      render 'edit'
    end
  end
  
#    def edit
#    @categories = Category.all.map{ |c| [c.name, c.id] }
#  end
#  
#  def update
#    @play.category_id = params[:category_id]
#    
#    if @play.update(play_params)
#      flash[:notice] = "Details have been updated"
#      redirect_to play_path(@play)
#    else
#      flash[:notice] = "Hmm..unable to save updates"
#      render 'edit'
#    end
#  end
#  
#  def destroy
#    @play.destroy
#    flash[:notice] = "Play has been successfully deleted"
#    redirect_to root_path
#  end
#  
  
  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
  
  def find_play
    @play = Play.find(params[:play_id])
  end
  
  def find_review
    @review = Review.find(params[:id])
  end
end
