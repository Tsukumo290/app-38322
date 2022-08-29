class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to calendars_path
    else
      redirect_to calendars_path
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to calendars_path
  end

  private
  def calendar_params
    params.permit(:start_time, {image: []}).merge(user_id: current_user.id)
  end
end
