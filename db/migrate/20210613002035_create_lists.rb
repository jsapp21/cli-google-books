class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.integer :book_id
    end
  end
end
