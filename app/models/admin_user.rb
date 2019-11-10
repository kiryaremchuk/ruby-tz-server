class AdminUser < ApplicationRecord
  include RolesGetter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles

  after_create { |admin| admin.send_reset_password_instructions }
  def password_required?
    new_record? ? false : super
  end
end
