class PlaysController < ApplicationController
  before_action :find_play, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:category].blank?
      @plays = Play.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @plays = Play.where(:category_id => @category_id)
    end
  end

  def show
  end
  
  def new
    #@play = Play.new
    @play = current_user.plays.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end
  

  
  def create
    #@play = Play.new(play_params)
    @play = current_user.plays.build(play_params)
    @play.category_id = play_params[:category_id]
    
    if @play.save
      flash[:notice] = "Play has been added"
      redirect_to root_path
    else
      flash[:notice] = "Unable to save play"
      render 'new'
    end
  end
  
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end
  
  def update
    @play.category_id = params[:category_id]
    
    if @play.update(play_params)
      flash[:notice] = "Details have been updated"
      redirect_to play_path(@play)
    else
      flash[:notice] = "Hmm..unable to save updates"
      render 'edit'
    end
  end
  
  def destroy
    @play.destroy
    flash[:notice] = "Play has been successfully deleted"
    redirect_to root_path
  end
  
    
  private #private method exclusive to this controller
  
  def play_params
    params.require(:play).permit(:title, :description, :director, :category_id)
  end
  
  def find_play
    @play = Play.find(params[:id])
  end

end

