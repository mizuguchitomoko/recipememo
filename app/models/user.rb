class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  attachment :profile_image

  has_many :follower, class_name: "Relationship", foregin_key: "follower_id", dependent: :destroy#followしている人
  has_many :followed, class_name: "Relationship", foregin_key: "followed_id", dependent: :destroy#followされている人
  has_many :following_user, through: :follower, source: :followed#自分がfollowしている人
  has_many :follower_user, through: :followed, source: :follower#自分をfollowしている人

  
end
