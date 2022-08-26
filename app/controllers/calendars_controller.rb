class CalendarsController < ApplicationController
  def index
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to calendars_path
    else
      render :new
    end
  end

  private
  def calendar_params
    params.require(:calendar).permit(image: []).merge(user_id: current_user.id)
  end
end
