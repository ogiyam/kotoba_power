class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :group_users
  has_many :group_words
  has_many :groups, through: :group_users
  
  validates :nickname, uniqueness: true
end
