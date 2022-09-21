class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to User
      t.belongs_to Post

      t.timestamps
    end
  end
end
