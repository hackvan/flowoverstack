class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true

  scope :order_by_oldest, -> { order("id asc") }

end
