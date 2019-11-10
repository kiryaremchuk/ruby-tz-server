class Group < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :books, join_table: :books_groups

  accepts_nested_attributes_for :books
end
