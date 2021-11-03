class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users, dependent: :destroy
  has_many :group_words, dependent: :destroy
  has_many :groups, through: :group_users, dependent: :destroy

end
