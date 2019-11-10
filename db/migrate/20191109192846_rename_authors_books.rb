class RenameAuthorsBooks < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :authors_books, :books_authors
  end

  def self.down
    rename_table :books_authors, :authors_books
  end
end
