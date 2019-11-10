class CreateJoinTableBooksAuthors < ActiveRecord::Migration[6.0]
  def change
    create_join_table :authors, :books do |t|
      t.index [:book_id, :author_id]
      t.index [:author_id, :book_id]
    end
  end
end
