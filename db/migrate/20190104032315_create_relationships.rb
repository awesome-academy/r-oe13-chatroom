class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :friend_id
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :relationships, :friend_id
    add_index :relationships, [:user_id, :friend_id], unique: true
  end
end
