class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: { message: 'This username is already in use' }
  validates :password, presence: true

  has_many :started_lessons, dependent: :destroy
  has_many :lessons, through: :started_lessons
  has_many :tracks, through: :lessons
  has_many :posts
  has_many :comments
  has_many :prompts
end
