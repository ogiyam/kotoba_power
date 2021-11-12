class GroupWord < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  has_many :yes_opinions, dependent: :destroy
  has_many :no_opinions, dependent: :destroy

  validates :word, presence: true

  enum status: { "投票中": 0, "結果発表": 1 }

  def yes_opinions_by?(user)
    yes_opinions.where(user_id: user.id).exists?
  end

  def no_opinions_by?(user)
    no_opinions.where(user_id: user.id).exists?
  end
end
