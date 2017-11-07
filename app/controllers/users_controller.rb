class UsersController < ApplicationController
  def dashboard
    today_sessions_count = current_user.daily_sessions.where("created_at > ?", Date.today.beginning_of_day).count
    @disable_session_button = (today_sessions_count > 0) ? true : false
  end

  def start_session
    daily_session = current_user.daily_sessions.create
    @daily_sessions_time = current_user.daily_sessions.order("id DESC").page(params[:page]).per(5)
    if (daily_session.created_at < Date.today.beginning_of_day + 10)
      flash.now[:notice] = "You session has successfully logged."
    else
      flash.now[:alert] = "You session has successfully logged, but you are late."
    end
  end

  def get_daily_sessions
    @daily_sessions_time = current_user.daily_sessions.order("id DESC").page(params[:page]).per(5)
  end
end
