class UsersController < ApplicationController
  def dashboard
  end

  def start_session
    daily_session = current_user.daily_sessions.create
    if (daily_session.created_at < Date.today.beginning_of_day + 10)
      flash.now[:notice] = "You session has successfully logged."
    else
      flash.now[:alert] = "You session has successfully logged, but you are LATE."
    end
  end
end
