class MemosController < ApplicationController
  def create
    @closet = Closet.find(params[:closet_id])
    @memo = current_user.memos.new(memo_params)
    if @memo.save
      render :post_memos
    end
  end

  def destroy
    Memo.find_by(id: params[:id], closet_id: params[:closet_id]).destroy
    @closet = Closet.find(params[:closet_id])
    render :post_memos
  end

  private
  def memo_params
    params.require(:memo).permit(:content).merge(user_id: current_user.id, closet_id: params[:closet_id])
  end
end
