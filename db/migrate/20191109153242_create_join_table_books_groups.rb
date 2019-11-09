class CreateJoinTableBooksGroups < ActiveRecord::Migration[6.0]
  def change
    create_join_table :books, :groups do |t|
      t.index [:book_id, :group_id]
      t.index [:group_id, :book_id]
    end
  end
end
