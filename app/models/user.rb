class User < ApplicationRecord
  has_secure_password # class method

  # model/server-side validation mandatory fields
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
