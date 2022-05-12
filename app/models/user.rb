class User < ApplicationRecord
  include FriendlyId
  include Gravtastic

  has_many :questions, dependent: :delete_all
  has_many :authored_questions, class_name: 'Question', foreign_key: 'author_id', dependent: :nullify
  has_secure_password

  friendly_id :nickname, use: :slugged

  gravtastic(secure: true, filetype: :png, size: 100, default: 'robohash')

  validates :email, 
    presence: true, 
    uniqueness: true,
    email: { mode: :strict, require_fqdn: true }
  
  validates :nickname, 
    uniqueness: true, 
    length: { maximum: 40 }, 
    format: { with: /\A[a-z\d_]+\z/ }

  validates :header_color, format: { with: /\A#[a-f0-9]{6}\z/i }
end
