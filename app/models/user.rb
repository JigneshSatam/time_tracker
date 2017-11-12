class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :daily_sessions, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  paginates_per 5

  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "must not have any special characters or spaces"}

  # CLASS METHODS
  def self.find_for_database_authentication(conditions={})
    find_by(username: conditions[:email]) || find_by(email: conditions[:email])
  end

  def self.todays_late_users_count
    self.joins(:daily_sessions).where("daily_sessions.created_at > ?", (Date.today.beginning_of_day + 10.hours ) ).pluck("COUNT( DISTINCT users.id)").first
  end

  # INSTANCE METHODS
  def monthly_average_daily_sessions
    self.daily_sessions.current_month_sessions.select("avg(EXTRACT( EPOCH FROM created_at))")
  end

end
