class DailySession < ApplicationRecord
  belongs_to :user

  scope :current_month_sessions, -> { where("created_at > ?", Date.today.beginning_of_month.beginning_of_day) }
end
