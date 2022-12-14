class ClosetsController < ApplicationController
  before_action :closet_find, only: [:show, :destroy]

  def index
    @closets = Closet.where(user_id: current_user.id).order(:color_id)
    @memos = Memo.all
  end

  def show
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
    @closet.destroy
    redirect_to root_path
  end

  def stats
    @closets = Closet.where(user_id: current_user.id)
    @closets_month = Closet.group('MONTH(created_at)').where(user_id: current_user.id)
    @favorite_desc_spring = Closet.includes(:favorites).where(season_id: 1, user_id: current_user.id).sort do |a, b|
      b.favorites.size <=> a.favorites.size
    end.first(10)
    @favorite_asc_spring = Closet.includes(:favorites).where(season_id: 1, user_id: current_user.id).sort do |a, b|
      a.favorites.size <=> b.favorites.size
    end.first(10)
    @favorite_desc_summer = Closet.includes(:favorites).where(season_id: 2, user_id: current_user.id).sort do |a, b|
      b.favorites.size <=> a.favorites.size
    end.first(10)
    @favorite_asc_summer = Closet.includes(:favorites).where(season_id: 2, user_id: current_user.id).sort do |a, b|
      a.favorites.size <=> b.favorites.size
    end.first(10)
    @favorite_desc_autumn = Closet.includes(:favorites).where(season_id: 3, user_id: current_user.id).sort do |a, b|
      b.favorites.size <=> a.favorites.size
    end.first(10)
    @favorite_asc_autumn = Closet.includes(:favorites).where(season_id: 3, user_id: current_user.id).sort do |a, b|
      a.favorites.size <=> b.favorites.size
    end.first(10)
    @favorite_desc_winter = Closet.includes(:favorites).where(season_id: 4, user_id: current_user.id).sort do |a, b|
      b.favorites.size <=> a.favorites.size
    end.first(10)
    @favorite_asc_winter = Closet.includes(:favorites).where(season_id: 4, user_id: current_user.id).sort do |a, b|
      a.favorites.size <=> b.favorites.size
    end.first(10)
  end

  private

  def closet_params
    params.require(:closet).permit(:brand, :price, :image, :genre_id, :color_id, :season_id,
                                   :size_id).merge(user_id: current_user.id)
  end

  def closet_find
    @closet = Closet.find(params[:id])
  end
end
