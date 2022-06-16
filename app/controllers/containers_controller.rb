class ContainersController < ApplicationController
  def new
    @container = Container.new
  end

  def create
    @container = Container.new(container_params)
    @container.user = current_user

    if @container.save
      redirect_to plan_path
    else
      render :new
    end
  end

  def edit
    @container = Container.find(params[:id])
  end

  def update
    @container = Container.find(params[:id])
    if @container.update(container_params)
      redirect_to plan_path
    else
      render :edit
    end
  end

  def destroy
    @container = Container.find(params[:id])
    @container.destroy
    redirect_to plan_path
  end

  private

  def container_params
    params.require(:container).permit(:card_category)
  end
end
