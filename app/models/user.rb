class User < ApplicationRecord
  has_secure_password

  validates :email, 
    presence: true, 
    uniqueness: true,
    email: { mode: :strict, require_fqdn: true }
  
  validates :nickname, 
    uniqueness: true, 
    length: { maximum: 40 }, 
    format: { with: /\A[a-z\d_]+\z/ }

  validates :header_color, format: { with: /\A#[a-f0-9]{6}\z/i }

  def downcase_nickname
    nickname.downcase!
  end
end
