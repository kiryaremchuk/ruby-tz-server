class Role < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :admin_users
end
