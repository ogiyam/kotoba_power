class GroupWord < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true

  validates :word, presence: true
end
