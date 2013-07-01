class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.integer :book_id
      t.string :name
      t.text :description
      t.integer :page

      t.timestamps
    end
  end
end
