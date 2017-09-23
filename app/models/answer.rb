class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many   :comments, as: :commentable
  has_many   :votes,    as: :votable

  validates :body, presence: true

  def voted_by?(user)
    votes.exists?(user: user)
  end
end
