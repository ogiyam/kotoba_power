class GroupWord < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  validates :word, presence: true
end
