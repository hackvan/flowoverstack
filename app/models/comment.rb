class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true, length: { maximum: 255 }

  scope :order_by_oldest, -> { order("id asc") }

end
