class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :cover_url
      t.timestamps
    end
  end
end
