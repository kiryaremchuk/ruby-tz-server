class Book < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :groups
end
