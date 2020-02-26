class ApplicationController < ActionController::Base
  before_action :set_user
  protect_from_forgery

  private

  def set_user
    @user = current_user
  end
end
