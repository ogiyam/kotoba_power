class GroupWord < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  has_many :yes_opinions, dependent: :destroy

  validates :word, presence: true
  
  def yes_opinions_by?(user)
    yes_opinions.where(user_id: user.id).exists?
  end
end
