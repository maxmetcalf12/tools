class ApplicationController < ActionController::Base
  before_action :set_user

  private

  def set_user
    @user = user_signed_in? ? current_user : User.find(2)
  end
end
