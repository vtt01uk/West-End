class PlaysController < ApplicationController
  before_action :find_play, only: [:show, :edit, :update, :destroy]
  
  def index
    @plays = Play.all.order('created_at DESC')
  end

  def new
    @play = Play.new
  end
  
  def show

  end
  
  def create
    @play = Play.new(play_params)
    if @play.save
      flash[:notice] = "Play has been added"
      redirect_to root_path
    else
      flash[:notice] = "Unable to save play"
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
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
    params.require(:play).permit(:title, :description, :director)
  end
  
  def find_play
    @play = Play.find(params[:id])
  end

end

