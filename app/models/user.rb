class User < ActiveRecord::Base
  # email, password_digest

  has_secure_password

  validates :password, length: { minimum: 5 }, on: :create

  before_save :downcase_email

  private

  def downcase_email
    email.downcase!
  end
end