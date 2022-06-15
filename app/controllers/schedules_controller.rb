class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user = current_user

    if @schedule.save
      redirect_to schedules_path, notice: "Save!"
    else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render :edit
    end
  end

  def destroy
    # @schedule = Schedule.find(params[:schedule_id])
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path
  end



  private

  def schedule_params
    params.require(:schedule).permit(:title, :date)
  end
end
