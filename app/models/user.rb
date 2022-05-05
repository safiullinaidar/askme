class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, 
    presence: true, 
    uniqueness: true,
    email: {mode: :strict, require_fqdn: true}
  
  validates :nickname, 
    uniqueness: true, 
    length: { maximum: 40 }, 
    format: { with: /\A[a-z0-9_]+\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
