class ClosetsController < ApplicationController

  def index
    @closets = Closet.order(:color_id)
    @memos = Memo.all
  end

  def show
    @closet = Closet.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
    @memo = Memo.new
  end

  def new
    @closet = Closet.new
  end

  def create
    @closet = Closet.new(closet_params)
    if @closet.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def closet_params
    params.require(:closet).permit(:brand, :price, :image, :genre_id, :color_id, :season_id, :size_id).merge(user_id: current_user.id)
  end

end