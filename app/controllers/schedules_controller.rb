class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  def new
    # @schedule = Schedule.find(params[:schedule_id])
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user = current_user

    if @schedule.save
      redirect_to schedules_path, notice: "Your purchase has been successfully approved!"
    else
      render :new
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :date)
  end
end
