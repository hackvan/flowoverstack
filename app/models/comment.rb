class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :body, presence: true, length: { maximum: 255 }

  scope :order_by_oldest, -> { order("id asc") }

end
