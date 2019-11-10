class Author < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :books, join_table: :books_authors

  accepts_nested_attributes_for :books
end
