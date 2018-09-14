class HomeController < ApplicationController
  before_action :current_user

  def top
    if @current_user
      @current_user = User.find_by(id: current_user.id)
      @credits = Credit.find_by(user_id: current_user.id).credits
    end

  end
end
