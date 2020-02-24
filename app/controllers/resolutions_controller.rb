class ResolutionsController < ApplicationController
  def index
    @resolutions = Resolution.where(user: @user)
    @new_resolution = Resolution.new
  end

  def show
    @resolution = Resolution.find(params[:id])
    @resolution_updates = ResolutionUpdate.where(resolution: @resolution)
    @new_update = ResolutionUpdate.new
  end

  def create
    Resolution.create(resolution_params)

    redirect_to resolutions_path
  end

  def update
    @resolution = Resolution.find(params[:id])

    redirect_to resolution_path(@resolution)
  end

  def destroy
    Resolution.find(params[:id]).destroy

    redirect_to resolutions_path
  end

  private

  def resolution_params
    params.require(:resolution).permit(
      :title,
      :short_description,
      :user_id
    )
  end
end
