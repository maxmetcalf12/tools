class ResolutionUpdatesController < ApplicationController
  def show
    @resolution = ResolutionUpdate.find(params[:id])
  end

  def create
    ResolutionUpdate.create(resolution_update_params)

    redirect_to resolution_path(resolution_update_params[:resolution_id])
  end

  def destroy
    ResolutionUpdate.find(params[:id]).destroy

    redirect_to resolution_path(params[:resolution_id])
  end

  private

  def resolution_update_params
    params.require(:resolution_update).permit(
      :title,
      :description,
      :resolution_id,
      :date
    )
  end
end
