class UsersController < ApplicationController
  def dashboard
    today_sessions_count = current_user.daily_sessions.where("created_at > ?", Date.today.beginning_of_day).count
    @disable_session_button = (today_sessions_count > 0) ? true : false

    @average_time = get_average_session_time
  end

  def start_session
    daily_session = current_user.daily_sessions.create
    @daily_sessions_time = current_user.daily_sessions.order("id DESC").page(params[:page]).per(5)
    @average_time = get_average_session_time
    if (daily_session.created_at < Date.today.beginning_of_day + 10)
      flash.now[:notice] = "You session has successfully logged."
    else
      flash.now[:alert] = "You session has successfully logged, but you are late."
    end
  end

  def get_daily_sessions
    @daily_sessions_time = current_user.daily_sessions.order("id DESC").page(params[:page]).per(5)
  end

  def admin_dashboard
    # debugger
    @todays_late_users_count = User.todays_late_users_count
  end

  private
    def get_average_session_time
      average_time = nil
      avg_daily_sessions = current_user.monthly_average_daily_sessions
      if avg_daily_sessions.present? && (secs = avg_daily_sessions[0].avg)
        date = DateTime.strptime(secs.to_s, "%s").localtime
        average_time = date.strftime("%I:%M:%S %P")
      end
      return average_time
    end
end
