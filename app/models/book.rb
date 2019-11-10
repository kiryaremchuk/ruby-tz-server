class Book < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :authors, join_table: :books_authors
  has_and_belongs_to_many :groups, join_table: :books_groups

  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :groups
end
