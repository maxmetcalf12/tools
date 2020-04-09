class ApplicationController < ActionController::Base
  before_action :set_user
  skip_before_action :verify_authenticity_token

  private

  def set_user
    @user = current_user || User.all.first
  end
end
