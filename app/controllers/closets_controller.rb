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
      flash.now[:alert] = '項目を入力してください'
      render :new
    end
  end

  def destroy
    @closet = Closet.find(params[:id])
    @closet.destroy
    redirect_to root_path
  end

  def stats
    @closets = Closet.all
    @closets_month = Closet.group("MONTH(created_at)")

    @favorite_desc_spring = Closet.includes(:favorites).where(season_id: 1).sort {|a,b| b.favorites.size <=> a.favorites.size}.first(10)
    @favorite_asc_spring = Closet.includes(:favorites).where(season_id: 1).sort {|a,b| a.favorites.size <=> b.favorites.size}.first(10)
    @favorite_desc_summer = Closet.includes(:favorites).where(season_id: 2).sort {|a,b| b.favorites.size <=> a.favorites.size}.first(10)
    @favorite_asc_summer = Closet.includes(:favorites).where(season_id: 2).sort {|a,b| a.favorites.size <=> b.favorites.size}.first(10)
    @favorite_desc_autumn = Closet.includes(:favorites).where(season_id: 3).sort {|a,b| b.favorites.size <=> a.favorites.size}.first(10)
    @favorite_asc_autumn = Closet.includes(:favorites).where(season_id: 3).sort {|a,b| a.favorites.size <=> b.favorites.size}.first(10)
    @favorite_desc_winter = Closet.includes(:favorites).where(season_id: 4).sort {|a,b| b.favorites.size <=> a.favorites.size}.first(10)
    @favorite_asc_winter = Closet.includes(:favorites).where(season_id: 4).sort {|a,b| a.favorites.size <=> b.favorites.size}.first(10)
  end

  def calendar

  end

  private
  def closet_params
    params.require(:closet).permit(:brand, :price, :image, :genre_id, :color_id, :season_id, :size_id).merge(user_id: current_user.id)
  end

end