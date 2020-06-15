class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages
  
  validates :name, presence: true, uniqueness: true
  has_many :okays, dependent: :destroy
  has_many :okays_users, through: :okays, source: :user
end
