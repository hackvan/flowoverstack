class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable

  validates :title, presence: true

  validates :body, presence: true

end
