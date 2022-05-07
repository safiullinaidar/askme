class User < ApplicationRecord
  has_secure_password

  validates :email, 
    presence: true, 
    uniqueness: { case_sensitive: false },
    email: { mode: :strict, require_fqdn: true }
  
  validates :nickname, 
    uniqueness: true, 
    length: { maximum: 40 }, 
    format: { with: /\w+\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
