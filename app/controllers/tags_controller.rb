class TagsController < ApplicationController
  before_action :set_tag, only: %i[update destroy]

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.user = current_user

    if @tag.save
      redirect_to plan_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to plan_path
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to plan_path
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :color)
  end
end
