class User < ApplicationRecord
  has_many :articles
  has_one :profile
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_secure_password

  class << self

    def digest(str)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(str, cost: cost)
    end

  end
end
