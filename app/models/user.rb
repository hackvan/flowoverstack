class User < ApplicationRecord

  has_many :questions
  has_many :answers

  before_save { email.downcase! }

  validates :name, presence: true,
                   length:   { maximum: 50 }

  validates :email, presence:   true,
                    email:      true,
                    length:     { maximum: 255 },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, presence: true,
                       allow_nil: true,
                       length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
