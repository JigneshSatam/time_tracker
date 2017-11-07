class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :daily_sessions, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  paginates_per 5

  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "must not have any special characters or spaces"}

  def self.find_for_database_authentication(conditions={})
    find_by(username: conditions[:email]) || find_by(email: conditions[:email])
  end
end
