class HomeController < ApplicationController
  def top
    if current_user
      @current_user = User.find_by(id: current_user.id)
    end

    @credits = Credit.find_by(user_id: current_user.id).credits
  end
end
