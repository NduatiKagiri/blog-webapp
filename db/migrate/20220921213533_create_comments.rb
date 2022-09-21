class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to User
      t.belongs_to Post
      t.text :text

      t.timestamps
    end
  end
end
