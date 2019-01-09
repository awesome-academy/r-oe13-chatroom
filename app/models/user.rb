class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users, foreign_key: "owner_id"
  has_many :messages
  has_many :relationalships

  validates :name, presence: true, length: {maximum: Settings.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.max_email},
    format: {with: VALID_EMAIL_REGEX},uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.min_pass}
  validates :phone_number, numericality: true, length: {minimum: Settings.min_phone, maximum: Settings.max_phone}
  has_secure_password

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false unless digest
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def current_user? user
    user == current_user
  end

end
