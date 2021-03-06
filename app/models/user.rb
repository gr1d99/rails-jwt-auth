class User < ApplicationRecord
  has_secure_password validations: false

  validates :email, presence: { message: I18n.t("errors.users.email.presence") }
  validates :email, uniqueness: { message: I18n.t("errors.users.email.unique") }
  validates :email, 'valid_email_2/email': { message: I18n.t("errors.users.email.invalid") }

  validates :password, presence: { on: :create, message: I18n.t("errors.users.password.presence") }
end
